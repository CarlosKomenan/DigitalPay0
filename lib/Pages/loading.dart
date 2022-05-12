// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) => isLoading
      ? Center(
          child: LoadingPage(),
        )
      : Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text("Succès"),
                  onPressed: () async {
                    setState(() => isLoading = true);
                    //call server api
                    await Future.delayed(Duration(
                      seconds: 5,
                    ));
                    setState(() => isLoading = false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  })),
        );
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[40],
      body: (Center(
        child: SpinKitCircle(
          size: 140,
          duration: Duration(seconds: 2),
          itemBuilder: (context, index) {
            final colors = [
              Colors.amber,
              Colors.white,
              Colors.pink,
              Colors.yellow
            ];
            final color = colors[index % colors.length];
            return DecoratedBox(
                decoration: BoxDecoration(
              color: color,
            ));
          },
        ),
        // height: 100,
        // width: 100,
        // color: Colors.white,
        // child: CircularProgressIndicator(
        //   color: Colors.orange,
        // ),
        // TweenAnimationBuilder(
        //     tween: Tween(begin: 0.0, end: 1.0),
        //     duration: Duration(seconds: 4),
        //     builder: (context, value, _) => SizedBox(
        //           width: 50,
        //           height: 50,
        //           child: CircularProgressIndicator(
        //             value: 0.5,
        //             backgroundColor: Colors.blue,
        //             strokeWidth: 3,
        //           ),
        //         ))
      )),
    );
  }
}
