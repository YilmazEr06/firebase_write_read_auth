import 'package:firebase_write_read_auth/Databse/dbfire.dart';
import 'package:firebase_write_read_auth/Databse/firebase.dart';
import 'package:firebase_write_read_auth/models/user.dart';

import 'package:firebase_write_read_auth/screens/signuppage/companents/signinformwidget.dart';
import 'package:flutter/material.dart';

class signupscreen extends StatefulWidget {

  @override
  State<signupscreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<signupscreen> {
  
  static createuseroperation(BuildContext context,
   String username,
   String lastname,
   String email,
   String password)  
  { 
   firebasehlp().createuserWithemailandPassword(email, password).then((value) {
    if (value == "succes"){ dbfire().addusers(
      User(name: username, surname: lastname, email: email, password: password))
      .then((value) {
         Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false); });}
    else print(value);
   },);

   

 }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  // TODO: implement widget
  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 173, 173, 170)
      ),
    
      body:  Container(
        color: const Color.fromARGB(255, 173, 173, 170),
        child:  MyCustomsignupForm(createuseroperation)
        ),
   
    );
  }
}
