import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_write_read_auth/Databse/firebase.dart';
import 'package:firebase_write_read_auth/models/user.dart';
import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mainpage> {
  Usermodel currentuser = Usermodel.defaultuser();
  void getuserinfo(String a) async {
      final docRef = await FirebaseFirestore.instance
          .collection("users").doc(a).get();
          setState(() {
             currentuser = Usermodel.fromFirestore(docRef);
          });
     
  
    }
  @override
  void initState() {
    getuserinfo(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    

    return 
    
    
      
        
         Scaffold(
          drawer: Drawer(
            width: (MediaQuery.of(context).size.width / 1.5),
            backgroundColor: const Color.fromRGBO(71, 70, 70, 0.356),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: CircleAvatar(
                    minRadius: 80,
                    backgroundColor: Colors.blue,
                  ),
                ),
               
                Text(currentuser.name),
                Text(currentuser.surname),
                Text(currentuser.email),
                Text(currentuser.birthday),
                Text(FirebaseAuth.instance.currentUser!.uid),
                ElevatedButton(onPressed: () {
                     firebasehlp().logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/loginscreen", (route) => false);
                }, child: Text("Logout"))
                
              ],
            ),
          ),



          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(
                    builder: (context) => ElevatedButton(
                          child: const Text("OPEN DRAWER"),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        )),
              ],
            ),
          ),
        );
      }

  }

