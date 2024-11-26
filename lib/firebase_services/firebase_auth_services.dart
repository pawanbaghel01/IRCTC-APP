
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Routing/routeConstant.dart';
import '../core/globals.dart' as gbl;

class FirebaseAuthService{
  static FirebaseAuth auth =FirebaseAuth.instance;

  static Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        Get.back();
        // If the user cancels the sign-in process
        Get.snackbar("Sign-In Cancelled", "User cancelled the sign-in process");
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential).then((userCredential) async {
        await googleSignIn.disconnect();
        gbl.isLogin.value = true;
        await FirebaseAuthService.setLoginValue();
        Get.back();
        Get.offAllNamed(RouteConstant.deshpage);
        Get.snackbar("Success", "Login Successful");
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar("Error", e.message ?? "Unknown error");
    } catch (e) {
      Get.back();
      Get.snackbar("Error", e.toString());
    }

  }


//       Future<void> signInWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);

//         // Sign in to Firebase with Facebook credential
//         UserCredential userCredential = await _auth.signInWithCredential(credential);

//         // Check if the email is already registered through other methods
//         if (userCredential.additionalUserInfo!.isNewUser) {
//           // New user, add data to Firestore
//           await firestore.collection('users').doc(userCredential.user!.uid).set({
//             'uid': userCredential.user!.uid,
//             'email': userCredential.user!.email,
//             'name': userCredential.user!.displayName,
//             'photoURL': userCredential.user!.photoURL,
//           });
//         } else {
//           // Existing user, link accounts if necessary
//           if (userCredential.user!.email != null) {
//             // Get the existing user
//             User? existingUser = _auth.currentUser;

//      // Check if the existing user has a different provider (like Google)
//             if (existingUser != null && existingUser.email != userCredential.user!.email) {
//               // Link the Facebook credential to the existing account
//               await existingUser.linkWithCredential(credential);
//               // Refresh the user data after linking
//               existingUser = _auth.currentUser;
//             }

//             // Update user data in Firestore if needed
//             await firestore.collection('users').doc(existingUser!.uid).update({
//               'name': existingUser.displayName,
//               'photoURL': existingUser.photoURL,
//             });
//           }
//         }

//         // Update authController with current user info
//         authController.user = userCredential.user;
//         authController.isSignedIn.value = true;

//         Get.snackbar('Success', 'Signed in with Facebook!');
//         Get.toNamed(RoutesConstant.home);
//       }
//     } catch (e) {
//       print(e);
//       Get.snackbar('Error', 'Failed to sign in with Facebook: $e');
//     }
//   }

 static Future<void> setLoginValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", gbl.isLogin.value);
   // glb.loginCheck();
  }
   static Future<void> getLoginValue() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
    gbl.isLogin.value = prefs.getBool("isLogin") ?? false;
  }

  static Future<void> setProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("profile", gbl.userProfile.value);
  }
  static Future<void> getPfofile() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
    gbl.userProfile.value = prefs.getString("profile")!;
  }
}