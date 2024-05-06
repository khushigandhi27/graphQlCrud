import 'dart:ffi';

import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_strings.dart' as gql_string;

Future<bool> updateUser(
    {String? title, String? description, String? category, Float? price, required id}) async {
  HttpLink link = HttpLink("https://1472-2405-201-2009-405f-10e2-1bcf-9f5a-21c9.ngrok-free.app"); // same link 
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.mutate( // mutate method , as we are mutating value
    MutationOptions( // mutation options
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          gql_string.updateMenuItemMutation,
        ),
        variables: { // it takes int so converting
          'title': title, // this is have you pass value for varible
          'description': description,
          'category': category,
          'price': price, 
        }),
  );

  return queryResult.data?['updateUserInfo'] ?? false; // here i get response in updateUserInfo as true or false
}
