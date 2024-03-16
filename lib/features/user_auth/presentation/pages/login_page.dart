import 'package:flutter/material.dart';
import 'package:finexus/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:finexus/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:finexus/global/common/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController ControllerEmail = TextEditingController();
  final TextEditingController ControllerPassword = TextEditingController();

  void _signIn(BuildContext context) async {
    try {
      String email = ControllerEmail.text;
      String password = ControllerPassword.text;

      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        showToast(message: "User is successfully signed in");
        Navigator.pushNamed(context, "/home");
      } else {
        showToast(message: "Some error occurred");
      }
    } catch (e) {
      showToast(message: "Some error occurred: $e");
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      showToast(message: "Some error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f3c65),
      // appBar: AppBar(
      //   backgroundColor: Color(0xff2f3c65),
      //   automaticallyImplyLeading: false,
      //   // title: Text("Login"),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 30),
              FormContainerWidget(
                controller: ControllerEmail,
                hintText: "Enter your Email",
                isPasswordField: false,
              ),
              SizedBox(height: 10),
              FormContainerWidget(
                controller: ControllerPassword,
                hintText: "Enter your Password",
                isPasswordField: true,
              ),
              SizedBox(height: 30),
              _buildButtonLogin(context),
              SizedBox(height: 10),
              _buildGoogleSignInButton(context),
              SizedBox(height: 20),
              _buildSignUpLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _signIn(context);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xff171f33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _signInWithGoogle(context);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.google, color: Colors.white),
              SizedBox(width: 5),
              Text(
                "Sign in with Google",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",style: TextStyle(color: Colors.white),),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
                  (route) => false,
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
