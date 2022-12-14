import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'Success.dart';

class SignUpPage extends StatefulWidget {
  Database? database;

  SignUpPage(this.database);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  List countryList = ["India", "USA", "Canada", "UK", "Australia"];
  String selectCountry = "  Select Country";
  String? currentCountry;
  bool isCountry = false;

  signup() {
    if (t1.text == "") {
      isCountry = false;
    } else if (t2.text == "") {
      isCountry = false;
    } else if (t3.text == "") {
      isCountry = false;
    } else if (t4.text == "") {
      isCountry = false;
    } else if (selectCountry == "") {
      isCountry = false;
    } else {
      setState(() {
        isCountry = true;
      });
    }
  }

  countryMenu() {
    return countryList
        .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Image(
                  image: AssetImage("image/a1.png"),
                  color: Colors.black,
                  width: 200,
                  height: 50),
              Text(
                "Forcasting",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: t1,
                  cursorColor: Color(0xff808080),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Full Name",
                  ),
                  onChanged: (value) {
                    signup();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: t2,
                  cursorColor: Color(0xff808080),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Phone Number",
                  ),
                  onChanged: (value) {
                    signup();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(0xff808080))),
                  child: DropdownButton(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    hint: Text(selectCountry),
                    value: currentCountry,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    items: countryMenu(),
                    onChanged: (String? value) {
                      setState(() {
                        currentCountry = value ?? "";
                      });
                      signup();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
                child: TextField(
                  onChanged: (value) {
                    signup();
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: t3,
                  cursorColor: Color(0xff808080),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18, top: 15),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.visiblePassword,
                  controller: t4,
                  cursorColor: Color(0xff808080),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Password",
                  ),
                  onChanged: (value) {
                    signup();
                  },
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                    onTap: () async {
                      if (isCountry == true) {
                        String name, number, country, email, password;
                        name = t1.text;
                        number = t2.text;
                        country = currentCountry!;
                        email = t3.text;
                        password = t4.text;
                        print(name);
                        print(number);
                        print(country);
                        print(email);
                        print(password);
                        String sql =
                            "insert into exam values ('$name','$number''$country','$email','$password')";
                        print("sql= $sql");
                        int qry = await widget.database!.rawInsert(sql);
                        print("qry = $qry");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Success();
                          },
                        ));
                        t1.clear();
                        t2.clear();
                        t3.clear();
                        t4.clear();
                        selectCountry = currentCountry!;
                      } else {
                        print("This is not possible...");
                      }
                      setState(() {});
                    },
                    child: Ink(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: isCountry
                              ? LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                      Color(0xff47BFDF),
                                      Color(0xff4A91FF)
                                    ])
                              : LinearGradient(
                                  colors: [Colors.grey, Colors.grey])),
                      child: Center(
                          child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Already have an account?")),
                  TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(10, 0),
                          disabledForegroundColor: Colors.transparent),
                      onPressed: () {},
                      child: Text(
                        "Log in", //
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
