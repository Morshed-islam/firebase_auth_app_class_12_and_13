import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  Future<void> signUpAndCreateUser(String email, String password, String name) async {
    try {
      // Create a user in Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Add user data to Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'createdAt': DateTime.now(),
      });

      log("User signed up and data added to Firestore.");
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> retrieveUsers() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').get();

      for (var doc in snapshot.docs) {
        print("User ID: ${doc.id}, Data: ${doc.data()}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: const Text("Signup"),
              onPressed: () {
                signUpAndCreateUser("hello@gmail.com", "111111", "Rubel");
              },
            ),

          ],
        ),
      ),
    );
  }
}
