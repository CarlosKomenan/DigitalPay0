// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, avoid_print, non_constant_identifier_names, deprecated_member_use, unused_element

import 'package:digitalpay/Pages/Authentification/Sign_in.dart';
import 'package:digitalpay/Pages/BilanS.dart';
import 'package:digitalpay/Pages/loading.dart';
import 'package:digitalpay/Widgets/OperationCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/ClientCard.dart';
import 'Operation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController montantController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  // bool isHover = true;

  void Connexion(String montant, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        // await _auth
        //     .signInWithEmailAndPassword(email: email, password: password)
        //     .then((uid) => {
        //           Fluttertoast.showToast(msg: "Vous êtes connecté"),
        //           // Navigator.of(context).pushReplacement(
        //           //     MaterialPageRoute(builder: (context) => HomeScreen())),
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Loading()),
            (route) => false);
        // } on FirebaseAuthException catch (e) {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text(e.message.toString()),
        //     backgroundColor: Colors.red,
        //   ));
      } catch (e) {
        print(e);
      }
    }
  }

  Future openDialog(String name) => showDialog(
      context: context,
      builder: (builder) => AlertDialog(
            title: Text(name),
            content: SafeArea(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: TextFormField(
                  controller: montantController,
                  onSaved: (value) {
                    montantController.text = value!;
                  },
                  validator: (value) {
                    //champ vide
                    if (value!.isEmpty) {
                      return "Veuillez renseigner le champ svp";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Entrer le montant',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ANNULER")),
              TextButton(
                  onPressed: () async {
                    if (isLoading) return;
                    setState(() => isLoading = true);
                    await Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                    setState(() {
                      // var val = montantController.toString();
                      Connexion(montantController.text, context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Loading()));
                    });
                    // Future.delayed(Duration(seconds: 2), () {
                    //   TweenAnimationBuilder(
                    //       tween: Tween(begin: 0.0, end: 1.0),
                    //       duration: Duration(seconds: 4),
                    //       builder: (context, value, _) => SizedBox(
                    //             width: 50,
                    //             height: 50,
                    //             child: CircularProgressIndicator(
                    //               value: 0.5,
                    //               backgroundColor: Colors.blue,
                    //               strokeWidth: 8,
                    //             ),
                    //           ));
                    // });
                  },
                  child: Text("VALIDER"))
            ],
          ));

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Quitter l'application"),
                  content: Row(children: [
                    Icon(Icons.warning, size: 30, color: Colors.red),
                    SizedBox(width: 15, height: 0),
                    Text("Êtes-vous sûres ??"),
                  ]),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "OUI",
                          style: TextStyle(color: Colors.red),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          "NON",
                          style: TextStyle(color: Colors.black54),
                        ))
                  ],
                ))) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
        child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                // color: Colors.blueGrey[30],
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 300,
                      // color: Colors.blueGrey[50],
                      child: Stack(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 280,
                          height: 260,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(_borderRaduis),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            gradient: LinearGradient(
                                colors: [Colors.orange, Colors.amber],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),

                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 75,
                                      width: 75,
                                      child: Image.asset(
                                        "assets/logoDF.png",
                                      ),
                                    ),
                                    Icon(
                                      Icons.settings,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Text(
                                  "DIGITAL PAY",
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: headline4,
                                    color: Colors.white,
                                  ),
                                  // style: GoogleFonts.roboto(
                                  //   fontSize: 30,
                                  //   fontWeight: FontWeight.bold,
                                  //   color: Colors.white,
                                  // ),
                                  // style: TextStyle(
                                  //   color: Colors.white,
                                  //   fontSize: 30,
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignIn()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 30, top: 50),
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Déconnexion",
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
                      ]),
                    ),
                    Container(
                      // color: Colors.blueGrey[50],
                      // height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              bottom: 13,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Opérateurs",
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: headline4,
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 9,
                                      width: 9,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected1
                                            ? Colors.amber
                                            : Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 9,
                                      width: 9,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected2
                                            ? Colors.amber
                                            : Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 9,
                                      width: 9,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected3
                                            ? Colors.amber
                                            : Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 9,
                                      width: 9,
                                      margin: EdgeInsets.only(right: 30),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected4
                                            ? Colors.amber
                                            : Colors.black,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 200,
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    GestureDetector(
                                      // onHover: (ishover) {
                                      //   isSelected1 = false;
                                      //   isSelected2 = false;
                                      //   isSelected3 = false;
                                      //   isSelected4 = false;
                                      //   setState(() => isSelected1 = ishover);
                                      // },
                                      // onHorizontalDragStart:
                                      //     (DragStartDetails dragEndDetails) {
                                      //   // isSelected1 = true;
                                      //   // isSelected2 = false;
                                      //   // isSelected3 = false;
                                      //   // isSelected4 = false;
                                      //   // openDialog("Orange money");
                                      //   print('Glisser');
                                      // },
                                      onTap: () async {
                                        isSelected1 = true;
                                        isSelected2 = false;
                                        isSelected3 = false;
                                        isSelected4 = false;
                                        // await Future.delayed(
                                        //     Duration(seconds: 1), () {});
                                        openDialog("Orange money");
                                        // setState(() {
                                        //   openDialog("Orange money");
                                        // });
                                      },
                                      child: OperationCard(
                                        name: "Orange Money",
                                        img: Image.asset(
                                          "assets/orange.png",
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        decor: isSelected1
                                            ? BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.amberAccent,
                                                      Colors.white10,
                                                      Colors.amberAccent,
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight),
                                              )
                                            : BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      // onHorizontalDragEnd:
                                      //     (DragEndDetails dragEndDetails) {
                                      //   // isSelected1 = true;
                                      //   // isSelected2 = false;
                                      //   // isSelected3 = false;
                                      //   // isSelected4 = false;
                                      //   // openDialog("Orange money");
                                      // },
                                      onTap: () {
                                        isSelected1 = false;
                                        isSelected2 = true;
                                        isSelected3 = false;
                                        isSelected4 = false;
                                        // isHover = false;
                                        openDialog("Mtn mobile Money");
                                      },
                                      child: OperationCard(
                                        name: "Mtn Money",
                                        img: Image.asset(
                                          "assets/mtn.jpg",
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        decor: isSelected2
                                            ? BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.amberAccent,
                                                      Colors.white10,
                                                      Colors.amberAccent,
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight),
                                              )
                                            : BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        isSelected1 = false;
                                        isSelected2 = false;
                                        isSelected3 = true;
                                        isSelected4 = false;
                                        openDialog("Moov money");
                                      },
                                      child: OperationCard(
                                        name: "Moov Money",
                                        img: Image.asset(
                                          "assets/moov2.jpg",
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        decor: isSelected3
                                            ? BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.amberAccent,
                                                      Colors.white10,
                                                      Colors.amberAccent,
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight),
                                              )
                                            : BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        isSelected1 = false;
                                        isSelected2 = false;
                                        isSelected3 = false;
                                        isSelected4 = true;
                                        openDialog("Carte de crédit");
                                      },
                                      child: OperationCard(
                                        name: "Master & Visa",
                                        img: Image.asset(
                                          "assets/card/bank2.png",
                                          height: 80,
                                          width: 100,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        decor: isSelected4
                                            ? BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.amberAccent,
                                                      Colors.white10,
                                                      Colors.amberAccent,
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight),
                                              )
                                            : BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                color: Colors.white),
                                      ),
                                    ),
                                  ])),
                          SizedBox(
                            height: 50,
                          ),
                          Divider(
                            height: 40,
                            thickness: 2,
                            indent: 70,
                            endIndent: 70,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BilanSemaine()));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.grey[400],
                              icon: Icon(Icons.history),
                              textTheme: ButtonTextTheme.normal,
                              label: Text("Historique",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: headline4, fontSize: 20))),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //     // borderRadius: BorderRadius.circular(_borderRaduis),
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(30),
                    //       topRight: Radius.circular(30),
                    //     ),
                    //     gradient: LinearGradient(
                    //         colors: [Colors.orange, Colors.amber],
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight),
                    //   ),
                    //   height: 100,
                    //   child: Center(
                    //     child: Text(
                    //       "Copyright © 2022 \n",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
                height: 100,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(_borderRaduis),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.amber],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Copyright © 2022 \n",
                      style: GoogleFonts.aBeeZee(
                          textStyle: headline4,
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ))),
      ),
    );
  }
}
