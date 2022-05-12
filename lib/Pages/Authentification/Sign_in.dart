// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers

import 'package:digitalpay/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'Sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                ),
                color: Colors.amber,
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
                        margin: EdgeInsets.only(right: 30, top: 0),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 70),
                padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 1), blurRadius: 1)
                    ]),
                alignment: Alignment.center,
                child: TextField(
                    cursorColor: Color(0xffF5591F),
                    decoration: InputDecoration(
                        icon: Icon(Icons.email, color: Colors.amber),
                        hintText: "Entrer votre email",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none))),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 50),
                padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 1), blurRadius: 1)
                    ]),
                alignment: Alignment.center,
                child: TextField(
                    obscureText: true,
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key, color: Colors.amber),
                        hintText: "Entrer votre mot de passe",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none))),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 20, right: 30),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 70),
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
                  "Connexion",
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
                            builder: ((context) => SignUp()),
                          ))
                    },
                    child: Text(
                      "Créer un compte",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
