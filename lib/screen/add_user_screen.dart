import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphqldemo/service/create_user.dart';
import 'package:graphqldemo/service/get_user.dart';
import 'package:graphqldemo/snackbar.dart';
import 'package:graphqldemo/service/update_user.dart';

class AddUpdateUserScreen extends StatefulWidget {
  const AddUpdateUserScreen({Key? key}) : super(key: key);
  static const routeName = "addUpdateUser";
  @override
  State<AddUpdateUserScreen> createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUserScreen> {
  // that's all for api call now let's see ui
  //  it's simple 3 field and one button to submit

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String title = '';
  String description = '';
  String category = '';
  Float? price;
  String? id;
  Map<String, dynamic>? _menu;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      id = ModalRoute.of(context)?.settings.arguments as String?; // id passing from main screen 

      if (id != null) { // if i am getting id then it's for update so 
      //  
        loadData(id ?? '');
      }
    });
    _titleController.addListener(() {
      setState(() {
        title = _titleController.text.trim();
      });
    });
    _descriptionController.addListener(() {
      setState(() {
        description = _descriptionController.text.trim();
      });
    });
    _categoryController.addListener(() {
      setState(() {
        category = _categoryController.text.trim();
      });
    });
    super.initState();
  }

  loadData(String id) async {
    //  using that id to fetch data as we see just how to read single data is same
    _menu = await getUser(id: int.tryParse(id)); // getUser takes' int so convert string to int
    if (_menu != null && _menu!.isNotEmpty) { // after getting data i am assigning data to textfield 
      _titleController.text = _menu?['title'] ?? '';
      _descriptionController.text = _menu?['description'] ?? '';
      _categoryController.text = _menu?['category'] ?? '';
    }
  }


// that's all now let's see this in action
//  let's refresh 
//  we got our data
//  now let's see how did we displayed this

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_menu != null ? "Update Menu Item" : "Add Menu Item"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: TextField(
                controller: _titleController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter name",
                  label: Text(
                    "Name",
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.' ]")),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: TextField(
                controller: _descriptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter description",
                  label: Text(
                    "Description",
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: TextField(
                controller: _categoryController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter category",
                  label: Text(
                    "category",
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.' ]")),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: allowToSubmit()
                  ? () async {
                        // Removed email validation code
                        FocusScope.of(context).requestFocus(FocusNode());
                        // Removed email validation check
                        if (_menu!= null) { // if _user is not null it means it's update so here 
                          var res = await updateUser( // et's see update api call
                            id: _menu?['id'],
                            title: title, // this is have you pass value for varible
                            description: description,
                            category: category,
                            price: price, 
                          ); // we call update api
                          if (res) { // on reponse true 
                            snackBar("Menu Item updated", context);
                            Navigator.of(context).pop(); // close screen
                          } else {
                            snackBar("Failed to update menu item", context);
                            //  it got updated
                          }
                        } else {
                          //  i am passing values to createUser method which we just saw
                          var res = await createUser(
                              description: description, category: category, title: title);
                          if (res) {// in return it will be true or false
                            snackBar("Menu Item created", context); 
                            Navigator.of(context).pop();// after successful create close this screen
                          } else {
                            snackBar("Failed to create menu item", context);
                          }
                        }
                      }
                    : null,
                child: Text(_menu!= null? "Update" : "Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool allowToSubmit() {
    return title.isNotEmpty && description.isNotEmpty && category.isNotEmpty;
  }
}
