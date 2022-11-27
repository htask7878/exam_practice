import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class Success extends StatefulWidget {
  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage("image/a1.png"),
                      color: Colors.black,
                      width: 200,
                      height: 50),
                  Text(
                    "Forcasting",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                      color: Colors.blue,
                      image: AssetImage("image/a2.png")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Congratulations",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: AutoSizeText(
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            "Your Account Created Succesfully",
                            style: TextStyle(color: Color(0xff474F5A),fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                },));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  Center(
                   heightFactor: 2,
                    child: Text(
                      "Back to login",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
