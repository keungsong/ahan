import 'package:ahan/model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: Container(
                  width: 300,
                  height: 350,
                  child: Card(
                    elevation: 6,
                    shape: Border.all(color: Colors.white, width: 2),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child:
                                      Lottie.asset('assets/images/food.json')),
                              Text(
                                'Restaurant name',
                                style: TextStyle(
                                    fontFamily: 'Bebas Neue',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      autofocus: true,
                                      keyboardType: TextInputType.text,
                                      validator: RequiredValidator(
                                          errorText: 'enter your name'),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          contentPadding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          hintText: 'User name',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 2))),
                                      onSaved: (String name) {
                                        userModel.name = name;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: RequiredValidator(
                                          errorText: 'enter table number'),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.table_view),
                                        contentPadding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        hintText: 'Table Number',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 2),
                                        ),
                                      ),
                                      onSaved: (String table) {
                                        userModel.table = table;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      print(
                                          'name = ${userModel.name} table = ${userModel.table}');
                                      formKey.currentState.reset();
                                    }
                                  },
                                  color: Theme.of(context).primaryColor,
                                  child: Text('Confirm'))
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
