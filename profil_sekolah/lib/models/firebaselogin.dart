import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//display user
String name;
String email;
String imageUrl;

// ignore: deprecated_member_use
Future<String> signInWithGoogle() async {
  //inisiasi login
  await Firebase.initializeApp();

  //use google sign in
  final GoogleSignInAccount googleSignInAccount = await googleSignIn
      .signIn()
      .catchError((onError) => print('Error $onError'));

  if (googleSignInAccount == null) return null;

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  // make creditial auth
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  //inisiasi credential to user
  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  //user funtion
  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    //user display
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    // Store the retrieved data
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    //name take whatever
    // if (name.contains(" ")) {
    //   name = name.substring(0, name.indexOf(" "));
    // }

    print('Sign In With Google: $user');

    return '$user';
  }
  return null;
}

//SignOut User
Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
