import 'package:flutter/material.dart';
import 'package:graphqldemo/service/get_user.dart';

class DisplayUser extends StatefulWidget {
  const DisplayUser({Key? key}) : super(key: key);
  static const routeName = "/displayUser";

  @override
  State<DisplayUser> createState() => _DisplayUserState();
}

class _DisplayUserState extends State<DisplayUser> {
  String? id; // created this field to store userid from main screen

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        id = ModalRoute.of(context)?.settings.arguments as String?; // this is how to get data from one screen to another in named route
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getUser(id: int.tryParse(id?? '')), // calling getUser with id we got from main screen
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1100000D),
                      blurRadius: 16,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Id: " + snapshot.data?['id']),
                    Text("Title: " + snapshot.data?['title']),
                    Text("Description: " + snapshot.data?['description']),
                    Text("Category: " + snapshot.data?['category']),
                  ],
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
