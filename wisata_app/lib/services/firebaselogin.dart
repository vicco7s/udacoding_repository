import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wisata_app/services/sharedlogin.dart';

class FirebaseLoginService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  SharedPrefService _prefService = SharedPrefService();

  Future<User> getUserCurrent() async {
    User users = _auth.currentUser;
    return users;
  }

  Future<User> handleSignIn() async {
    try{
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn().catchError((onError) => print('onError'));
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential authResult = await _auth.signInWithCredential(credential);
      final User users = authResult.user;
      if(users != null){
        await _prefService.savedDataPref(
          datetype: 'bool',
          key: 'isLogin',
          value: true,
        );
        return users;
      }
      return null;
    }catch(e){
      print('Error Google SignIn');
      print(e);
      return null;
    }
  }
    Future<void> signOut() async {
      await _auth.signOut();
      await _googleSignIn.signOut();
      await _prefService.removeLoginData();
    }
}