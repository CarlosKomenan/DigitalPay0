// ignore_for_file: unused_import, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:digitalpay/Pages/Authentification/Sign_in.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              // color: Colors.amber,
              gradient: LinearGradient(colors: [
                Colors.orange.shade600,
                Colors.amber,
                // Colors.orange.shade600,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 190,
                    width: 190,
                    child: Image.asset("assets/logoDF.png"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 30, top: 0, bottom: 10),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "S'enregistrer",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 1)]),
              alignment: Alignment.center,
              child: TextField(
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      icon: Icon(Icons.apartment, color: Colors.amber),
                      hintText: "Nom entreprise",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none))),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 1)]),
              alignment: Alignment.center,
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email, color: Colors.amber),
                      hintText: "E-mail",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none))),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 1)]),
              alignment: Alignment.center,
              child: TextField(
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone, color: Colors.amber),
                      hintText: "Numéro de téléphone",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none))),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 1)]),
              alignment: Alignment.center,
              child: TextField(
                  obscureText: true,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key, color: Colors.amber),
                      hintText: "Mot de passe",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none))),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 1)]),
              alignment: Alignment.center,
              child: TextField(
                  obscureText: true,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      icon: Icon(Icons.key, color: Colors.amber),
                      hintText: "Confirmez le mot de passe",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none))),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 40),
              height: 54,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     colors: [Colors.amber, Colors.amberAccent],
                //     begin: Alignment.centerLeft,
                //     end: Alignment.centerRight),
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade600,
                    Colors.amber,
                    // Colors.orange.shade600,
                  ],
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Enregistrer",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Avez-vous déjà un compte ? ",
                  style: TextStyle(fontSize: 15),
                ),
                InkWell(
                  onTap: () => {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (builder) => SignUp()),
                    //     (route) => false)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SignIn()),
                        ))
                  },
                  child: Text(
                    "Connectez-vous",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ]))));
  }
}
