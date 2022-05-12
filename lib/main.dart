// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:digitalpay/Pages/Authentification/Accueil_auth.dart';
import 'package:digitalpay/Pages/Authentification/Sign_in.dart';
import 'package:digitalpay/Pages/Operation.dart';
import 'package:flutter/material.dart';

import 'Pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: AcceuilAuth(),
      debugShowCheckedModeBanner: false,
    );
  }
}
