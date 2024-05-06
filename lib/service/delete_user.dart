import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_strings.dart' as gql_string;

Future<bool> deleteUser({
  int? id,
}) async {
  HttpLink link = HttpLink("https://1472-2405-201-2009-405f-10e2-1bcf-9f5a-21c9.ngrok-free.app"); // same link
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.query(
    QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly, // this is not required , use only in get i.e when you are fetching data
        document: gql(
          gql_string.deleteMenuItemMutation,
        ),
        variables: {
          'id': id,
        }),
  );

  return queryResult.data?['deleteUser'] ?? false;  // same as other getting true or false in response
}
