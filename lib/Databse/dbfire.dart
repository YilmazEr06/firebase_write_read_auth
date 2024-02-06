import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_write_read_auth/models/user.dart';


class dbfire {
  FirebaseFirestore db = FirebaseFirestore.instance;
 
 Future<DocumentReference<Map<String, dynamic>>> addusers(Usermodel user,UserCredential credential) async{
    var a =db.collection("users").add(user.toFirestore());
    db.collection("users").doc(credential.user!.uid).set(user.toFirestore());
    return a;

  }
 
}
