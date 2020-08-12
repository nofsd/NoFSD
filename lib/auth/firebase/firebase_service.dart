import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  String usuario;
  String usuarioFoto;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    print("Firebase Name: " + user.displayName);
    print("Firebase Email: " + user.email);
    print("Firebase Foto: " + user.photoUrl);
    usuarioFoto = user.photoUrl;
    print('usuarioFoto: $usuarioFoto');

    return user;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    print('Usuario: $usuario');
  }
}
