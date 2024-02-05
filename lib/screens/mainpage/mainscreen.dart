import 'package:firebase_write_read_auth/Databse/firebase.dart';
import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  




  @override
  State<mainpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mainpage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
    
      body: Scaffold(
        body: TextButton(child: Text("Log out"),onPressed: () {
          firebasehlp().logout();
          Navigator.pushNamedAndRemoveUntil(context, "/loginscreen", (route) => false);
          
        },),
      ),
   
    );
  }
}
