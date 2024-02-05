import 'package:firebase_write_read_auth/Databse/firebase.dart';

import 'package:firebase_write_read_auth/screens/signuppage/companents/signinformwidget.dart';
import 'package:flutter/material.dart';

class signupscreen extends StatefulWidget {

  @override
  State<signupscreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<signupscreen> {
  static createuseroperation(BuildContext context, String username,String lastname,String email,String password)  
  async{ 
      firebasehlp().createuserWithemailandPassword(email, password);
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
