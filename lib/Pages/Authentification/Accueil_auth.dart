// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, use_function_type_syntax_for_parameters, non_constant_identifier_names

import 'dart:async';

import 'package:digitalpay/Pages/Authentification/Sign_in.dart';
import 'package:flutter/material.dart';

class AcceuilAuth extends StatefulWidget {
  const AcceuilAuth({Key? key}) : super(key: key);

  @override
  State<AcceuilAuth> createState() => _AcceuilAuthState();
}

class _AcceuilAuthState extends State<AcceuilAuth> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
    //  Navigator.pushAndRemoveUntil(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (builder) => SignUp()),
    //                               (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(colors: [
                Colors.orange.shade600,
                Colors.amber,
                Colors.orange.shade600,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Center(
            child: Container(
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 130,
                child: Image.asset("assets/logoDF.png"),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: 130,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Image.asset("assets/DFblack.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
