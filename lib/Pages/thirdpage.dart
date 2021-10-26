import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syoogle/Pages/fourthpage.dart';
import 'package:syoogle/logs.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _formKey = GlobalKey<FormState>();
  String answer_3;
  String message = "";

  @override
  void initState() {
    super.initState();
    goFullScreen();
  }

  void goFullScreen() {
    html.document.documentElement.requestFullscreen();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //alert on back pressed
        title: Text(
          "Warning",
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          "Already Escaping 2020 !!?",
          style: GoogleFonts.ubuntu(),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text("NO"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onBackPressed(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(1.0), BlendMode.softLight),
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1588613254750-cf5d89a29b66?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1008&q=80",
                  ),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: size.width * 0.5,
                        child: Card(
                          elevation: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "From the wall to whole world it roamed around without passport and created a ?",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.sourceCodePro(
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: size.width * 0.3,
                                        child: TextFormField(
                                          validator: (val) => val.isEmpty
                                              ? "Should Not Be Empty"
                                              : null,
                                          onChanged: (val) {
                                            answer_3 = val;
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Your Answer",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        message,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.sourceCodePro(
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 90.0,
                                        height: 50.0,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.orange),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              if (answer_3.toLowerCase() ==
                                                  "pandemic") {
                                                createlog("3", "100",
                                                    "Crossed Level3");

                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        FourthPage(),
                                                  ),
                                                );
                                              } else {
                                                setState(() {
                                                  message =
                                                      answer_3 + "Is Incorrect";
                                                });
                                              }
                                            }
                                          },
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        tooltip: "Want a Hint",
        child: Icon(
          Icons.help,
          color: Colors.white,
        ),
      ),
    );
  }
}
