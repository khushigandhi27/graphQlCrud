import 'package:app/domain/core/services/navigation_services/routers/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../config/injection.dart';
import '../navigation_services/navigation_service.dart';

class GraphQLService {
  final String httpUrl;
  final String? token;
  final bool isAuth;
  late DateTime lastUpdatedTokenAt;
  late GraphQLClient _client;

  GraphQLService({required this.httpUrl, this.token, this.isAuth = false}) {
    lastUpdatedTokenAt = DateTime.now();
    createService(httpUrl: httpUrl, token: token, isAuth: isAuth);
  }

  Future<void> createService({
    required String httpUrl,
    String? token,
    bool isAuth = false,
  }) async {
    Link link;
    if (isAuth) {
      final HttpLink httpLink = HttpLink(httpUrl);
      final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
      link = authLink.concat(httpLink);
    } else {
      link = HttpLink(httpUrl);
    }
    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        watchQuery: Policies.safe(
          FetchPolicy.networkOnly,
          ErrorPolicy.none,
          CacheRereadPolicy.ignoreAll,
        ),
        query: Policies.safe(
          FetchPolicy.networkOnly,
          ErrorPolicy.none,
          CacheRereadPolicy.ignoreAll,
        ),
        mutate: Policies.safe(
          FetchPolicy.networkOnly,
          ErrorPolicy.none,
          CacheRereadPolicy.ignoreAll,
        ),
      ),
    );
  }

  Future<QueryResult> performMutation(
    String query, {
    required Map<String, dynamic> variables,
    bool retry = true,
  }) async {
    final MutationOptions options =
        MutationOptions(document: gql(query), variables: variables);

    final result = await _client.mutate(options);

    if (result.hasException || result.data == null) {
      if (result.exception!.graphqlErrors
          .toString()
          .toLowerCase()
          .contains('customer not found!')) {
        skipNavigationForMinutes();
      }
      debugPrint(
        '''
      <========== \n
        client_exception: ${result.exception?.linkException} \n
        gql_exception: ${result.exception?.graphqlErrors} \n
        timestamp: ${result.timestamp.toString()} \n
      <==========
        ''',
      );
      if (retry) {
        return performMutation(query, variables: variables, retry: false);
      }
    }

    return result;
  }

  DateTime? currentTime;
  Future skipNavigationForMinutes() async {
    if (currentTime != null &&
        DateTime.now().difference(currentTime!).inMinutes < 1) {
      return;
    }
    currentTime = DateTime.now();
    navigator<NavigationService>().navigateTo(
      CommonRoutes.homeRoute,
      isClearStack: true,
    );
  }

  Future<QueryResult> performQuery(
    String query, {
    required Map<String, dynamic> variables,
    bool retry = true,
  }) async {
    final QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);
    final result = await _client.query(options);
    if (result.hasException) {
      if (result.exception!.graphqlErrors
          .toString()
          .toLowerCase()
          .contains('customer not found!')) {
        skipNavigationForMinutes();
      }
      debugPrint(
        '''
      <========== \n
        client_exception: ${result.exception?.linkException} \n
        gql_exception: ${result.exception?.graphqlErrors} \n
        timestamp: ${result.timestamp.toString()} \n
      <==========
        ''',
      );
      if (retry) {
        return performQuery(query, variables: variables, retry: false);
      }
    }
    return result;
  }

  // Future<QueryResult> performMutation(String query,
  //     {required Map<String, dynamic> variables}) async {
  //   final MutationOptions options = MutationOptions(
  //     document: gql(query),
  //     variables: variables,
  //   );
  //   final result = await _client.mutate(options);

  //   debugPrint(
  //     '''
  //     <========== inside result:\n ${result.data} \n
  //       gql_exception: ${result.exception?.graphqlErrors} \n
  //       timestamp: ${result.timestamp.toString()} \n
  //       ''',
  //   );

  //   return result;
  // }

  /* Stream<Response> subscriptionGraphQL(
    String query, {
    required Map<String, dynamic> variables,
    required String operationName,
  }) async* {
    final operation = Operation(
      document: gql(query),
      operationName: operationName,
    );
    final Request request = Request(operation: operation, variables: variables);
    yield* _socketClient.subscribe(request, true);
  } */
}
