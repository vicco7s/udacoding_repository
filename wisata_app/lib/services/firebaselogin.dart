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

  Future<User> _handleSignIn() async {
    try{
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn().catchError(onError) => print('Error');
    }catch(e){

    }
  }

}