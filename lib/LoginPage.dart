import 'package:flutter/material.dart';

import 'Success.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController l1 = TextEditingController();
  TextEditingController l2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image(
                        image: AssetImage("image/a1.png"),
                        color: Colors.black,
                        width: 200,
                        height: 50),
                    Text(
                      "Forcasting",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enter your email address and password",
                      style: TextStyle(color: Color(0xff808080)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 18, left: 18, top: 15),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: l1,
                        cursorColor: Color(0xff808080),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff808080)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff808080)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 18, left: 18, top: 15),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.visiblePassword,
                        controller: l2,
                        cursorColor: Color(0xff808080),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff808080)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff808080)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Password",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                          onTap: () {
                            if (l1.text != "" && l2.text != "") {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Success();
                                },
                              ));
                            }
                          },
                          child: Ink(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff47BFDF),
                                      Color(0xff4A91FF)
                                    ])),
                            child: Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Don’t have an account?")),
                  TextButton(
                      style: TextButton.styleFrom(
                          disabledForegroundColor: Colors.transparent),
                      onPressed: () {
                        print("This is one more");
                        // Navigator.pushReplacement(context, MaterialPageRoute(b,))
                      },
                      child: Text(
                        "Signup", //
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
