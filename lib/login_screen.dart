import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final phoneController = TextEditingController();
  final codeVerifyController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          // TextField(controller: emailController),
          // TextField(controller: passController),
          // ElevatedButton(
          //   onPressed: () async {
          //     try {
          //       var data = await auth.signInWithEmailAndPassword(
          //         email: emailController.text,
          //         password: passController.text,
          //       );
          //       if (data.user == null) {
          //         print("login failed");
          //       } else {
          //         print("login success ${data.user!.email}");
          //         print("login success ${data.user!.uid}");
          //       }
          //     } catch (e) {
          //       print(e.toString());
          //     }
          //   },
          //   child: const Text("Login"),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     try {
          //       var data = await auth.createUserWithEmailAndPassword(
          //         email: emailController.text,
          //         password: passController.text,
          //       );
          //       if (data.user == null) {
          //         print("login failed");
          //       } else {
          //         print("login success ${data.user!.email}");
          //         print("login success ${data.user!.uid}");
          //       }
          //     } catch (e) {
          //       print(e.toString());
          //     }
          //   },
          //   child: const Text("Create Account"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     if (auth.currentUser == null) {
          //       print("No User Login");
          //     } else {
          //       print(auth.currentUser!.uid);
          //       print(auth.currentUser!.email);
          //       print(auth.currentUser!.displayName);
          //     }
          //   },
          //   child: Text("Get Current User"),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     await auth.signOut();
          //   },
          //   child: Text("Logout"),
          // ),
          //!
          // TextField(controller: phoneController),
          // ElevatedButton(
          //   onPressed: () {
          //     auth.verifyPhoneNumber(
          //       // timeout: Duration(),
          //       phoneNumber: phoneController.text,
          //       verificationCompleted: (phoneAuthCredential) {},
          //       verificationFailed: (error) {},
          //       codeSent: (verificationId, forceResendingToken) {
          //         showDialog(
          //           context: context,
          //           builder: (context) {
          //             return Dialog(
          //               child: Column(
          //                 children: [
          //                   TextField(controller: codeVerifyController),
          //                   ElevatedButton(
          //                     onPressed: () async {
          //                       PhoneAuthCredential credential =
          //                           PhoneAuthProvider.credential(
          //                         verificationId: verificationId,
          //                         smsCode: codeVerifyController.text,
          //                       );
          //                       var data =
          //                           await auth.signInWithCredential(credential);
          //                       if (data.user == null) {
          //                         print("Login Error");
          //                       } else {
          //                         print("Login Success");
          //                       }
          //                     },
          //                     child: const Text("Confirm"),
          //                   )
          //                 ],
          //               ),
          //             );
          //           },
          //         );
          //       },
          //       codeAutoRetrievalTimeout: (verificationId) {
          //         print("Time out");
          //       },
          //     );
          //   },
          //   child: const Text("Send SMS"),
          // ),

          ElevatedButton(
            onPressed: () async {
              var data = await signInWithGoogle();
              print(data.user!.email);
            },
            child: const Text("Sign in with google"),
          ),
        ],
      ),
    );
  }
}
