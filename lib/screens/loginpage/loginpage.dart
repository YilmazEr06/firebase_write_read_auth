import 'package:firebase_write_read_auth/Databse/firebase.dart';
import 'package:firebase_write_read_auth/screens/loginpage/companents/loginformwidget.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
 
  @override
  State<loginpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<loginpage> {
  static loginoperaiton(BuildContext context, String controlleremail,String controllerpassword)  async{ 
     await firebasehlp()
                      .loginWithemailAndPassword(
                          controlleremail, controllerpassword)
                      .then((value) {
                    if (value == "succes") Navigator.pushNamed(context, "/main");
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(value)),
                      );
                    }
                  });}

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
    
      body:  Container(
        color: const Color.fromARGB(255, 173, 173, 170),
        child: MyCustomForm(loginoperaiton),
        ),
   
    );
  }
}
