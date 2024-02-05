import 'package:firebase_auth/firebase_auth.dart';

class firebasehlp {
  bool a = false;
  String user = "";
  bool get getstatus {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        a = false;
      } else {
        a = true;
      }
    });
    return a;
  }

  String get currentuserid {
    FirebaseAuth.instance.authStateChanges().listen((User? user1) {
      if (user1 != null) {
        user = user1.uid;
      }
    });
    return user;
  }

  createuserWithemailandPassword(String emailAddress, String password) async {
    try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

 Future<String> loginWithemailAndPassword(emailAddress, password) async {
    try {
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
          return "succes";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'No user found for that email.';
      }else if (e.code == "network-requested-faild"){
        return "Network eror";
      }
      else{
        return "There is a unkown eror";
      }
    }
  }
   logout() async {
    await FirebaseAuth.instance.signOut();
  }
 
}
