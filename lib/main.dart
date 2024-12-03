import 'package:firebase_auth_app/auth/login_screen.dart';
import 'package:firebase_auth_app/screens/userlist_screen/user_list_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBC4UTmTgUfmxe8FooN-d3sNdCD41nO1rU',
      appId: '1:683311085674:android:480ae34e9d806d826cf213',
      messagingSenderId: '683311085674',
      projectId: 'project-2a783',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsersListView(),
    );
  }
}
