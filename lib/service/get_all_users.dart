import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_strings.dart' as gql_string;

Future<List> getAllUsers() async {
  HttpLink link = HttpLink("https://1472-2405-201-2009-405f-10e2-1bcf-9f5a-21c9.ngrok-free.app"); // this is api call for getting all users
  GraphQLClient qlClient = GraphQLClient( // same client create
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.query( // here it's get type so using query method 
    QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: gql(
        gql_string.getMenuItemsQuery, // let's see query string
      ),
    ),
  );

return queryResult.data?['getMenuItems'] ?? []; // here i am getting list in getUsers field which i am return 
}
