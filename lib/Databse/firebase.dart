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

  Future<String> createuserWithemailandPassword(
      String emailAddress, String password) async {
    try {
      Future<UserCredential> a =
          FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return "succes";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
  
      } else if (e.code == 'email-already-in-use') {
    
        return 'The account already exists for that email.';
      }
      return e.code;
    } catch (e) {
 
      return 'The account already exists for that email.';
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
      } else if (e.code == "network-requested-faild") {
        return "Network eror";
      } else {
        return e.code;
      }
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
