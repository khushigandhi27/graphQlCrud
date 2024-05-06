import 'dart:ffi';

//import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_strings.dart' as gql_string;

Future<bool> createUser({String? title, String? description, String? category, Float? price}) async {
  HttpLink link = HttpLink("https://1472-2405-201-2009-405f-10e2-1bcf-9f5a-21c9.ngrok-free.app"); // it's my url
  GraphQLClient qlClient = GraphQLClient( // craete a graphql client
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  ); // ignore , just for cacheing
  QueryResult queryResult = await qlClient.mutate( // use mutate method for mutation
    MutationOptions( // we use mutation options
        fetchPolicy: FetchPolicy.networkOnly,// you can use different policy as per your need
        document: gql(
          gql_string.addMenuItemMutation, // as tou graphql need query string 
        ),
        variables: {
          'title': title, // this is have you pass value for varible
          'description': description,
          'category': category,
          'price': price, 
        }),
  );

  return queryResult.data?['createUser'] ?? false; // queryResult.data contains response data here after creation my api return true
  //  and if it's null then i am return false 
}
