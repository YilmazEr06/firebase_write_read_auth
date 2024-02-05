import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? name;
  final String? surname;
  final String? email;
  final String? password;
  User({required this.name, required this.surname, required this.email, required this.password});

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      name: data?['name'],
      surname: data?['surname'],
      email: data?['email'],
      password: data?['password'],
    );
  }

 

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (surname != null) "surname": surname,
      if (email != null) "email": email,
      if (password != null) "password": password,
      
    };
  }
}