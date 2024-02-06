import 'package:firebase_auth/firebase_auth.dart';
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
  
  static createuseroperation(
    BuildContext context,
    Usermodel user,
  
  )  
  async { 
    firebasehlp().createuserWithemailandPassword(user.email!,user.password!).then((value) async {


  
    if (value[0] == "succes") 
    { dbfire().addusers(
      Usermodel(
        name: user.name,
       surname: user.surname,
        email: user.email,
         password: user.password,
         birthday: user.birthday
          ),value[1] as UserCredential
          
          ).then((value) => Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false));
        
       
      
      
      
      }
    else print(value);

 });
   
   
 



   

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
      backgroundColor: const Color.fromARGB(255, 173, 173, 170),
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(0, 173, 173, 170)
      ),
    
      body:  Container(
        color: const Color.fromARGB(255, 173, 173, 170),
        child:  MyCustomsignupForm(createuseroperation)
        ),
   
    );
  }
}
