import 'package:auto_size_text/auto_size_text.dart';
import 'package:exam_practice/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database? database;

  @override
  void initState() {
    super.initState();
    dataBase();
  }

  dataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'ht.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE exam (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, number TEXT, country TEXT, email TEXT, password TEXT)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 17),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: AutoSizeText(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        "Explore global map of wind, weather, and ocean conditions")),
                SizedBox(height: 8,),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: AutoSizeText(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6B6A71),
                        ),
                        maxLines: 3,
                        "Planing your trip become more easier with ideate weather app. you can instantly see the whole word weather within few second")),
                SizedBox(
                  height: 110,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignUpPage(database);
                      },));
                    },
                    child: Container(
                      height: 60,
                      width: 260,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff47BFDF), Color(0xff4A91FF)])),
                      child: Center(
                          child: Text(
                        "Get start",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    )),
                SizedBox(
                  height: 8,
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
                          "Log in",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff47BFDF), Color(0xff4A91FF)])),
      ),
    );
  }
}
