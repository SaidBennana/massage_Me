import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  google_Sign_In() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final create = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      return FirebaseAuth.instance.signInWithCredential(create);
    } catch (e) {
      print(e);
    }
  }

  GoogleSingOut() {
    GoogleSignIn().signOut();
  }
}
