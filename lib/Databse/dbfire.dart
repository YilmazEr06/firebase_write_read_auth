import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_write_read_auth/models/user.dart';


class dbfire {
  FirebaseFirestore db = FirebaseFirestore.instance;
 
 Future<DocumentReference<Map<String, dynamic>>> addusers(User user) async{
    var a =db.collection("users").add(user.toFirestore());
    return a;

  }
 
}
