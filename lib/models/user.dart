import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Usermodel {
   String name;
   String surname;
   String email;
   String? password;
   String? uid;
   String birthday;
  Usermodel( {required this.birthday,  this.uid,required this.name, required this.surname, required this.email,  this.password});
 factory Usermodel.defaultuser(

   )
   { return Usermodel(
      name: 'name',
      surname: "surname",
      email: 'email',
      password: 'password',
      uid: 'uid',
      birthday : "birthday"
    );
    
   }
  factory Usermodel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,

  ) {
    final data = snapshot.data();
    return Usermodel(
      name: data?['name'],
      surname: data?['surname'],
      email: data?['email'],
      password: data?['password'],
      uid: data?['uid'],
      birthday : data?["birthday"]
    );
  }
  

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (surname != null) "surname": surname,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (uid != null) "uid": uid,
      if (birthday != null) "birthday": birthday,
    };
  }

  DateTime get getbirthdaydate{
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(birthday!); 
    return dateTime;
  }
}