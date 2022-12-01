import 'package:exam_practice/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splash();
  }

  splash() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  // final Shader linearGradient = LinearGradient(
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  //   colors: <Color>[Color(0xff47BFDF), Color(0xff4A91FF)],
  // ).createShader(Rect.fromLTRB(0, 0, 0, 100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
              image: AssetImage("image/a1.png"),
              color: Colors.black,
              width: 200,
              height: 50),
        ),
        Center(
          child: Text(
            "An Innovative Concept",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        GradientText(
          gradientType: GradientType.linear,
          gradientDirection: GradientDirection.ttb,
          colors: [Color(0xff47BFDF), Color(0xff4A91FF)],
          "Forcasting",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        // Text(
        //   "Forcasting",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //       foreground:new Paint()..shader = linearGradient,
        //       fontSize: 35,
        //       fontWeight: FontWeight.w600),
        // )
      ],
    )));
  }
}