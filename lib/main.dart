
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_write_read_auth/screens/loginpage/loginpage.dart';
import 'package:firebase_write_read_auth/screens/mainpage/mainscreen.dart';
import 'package:firebase_write_read_auth/screens/signuppage/signuppage.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


Future<void> main() async {
  
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  
  
  const MyApp({super.key});
  

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


   
    
    return MaterialApp(
    
      routes: {
      "/loginscreen":(context)=>loginpage(),
      "/signupscreen":(context)=>signupscreen(),
      "/main":(context)=>mainpage(),
      
    },
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null) 
  
? mainpage():loginpage(),
    );
  }
}

