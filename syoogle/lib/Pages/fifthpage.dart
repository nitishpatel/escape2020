import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syoogle/Pages/sixthpage.dart';
import 'package:syoogle/logs.dart';

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  final _formKey = GlobalKey<FormState>();
  String answer_5;
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
                    "https://images.news18.com/ibnlive/uploads/2020/01/jamia-2.jpg",
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
                                        "He was killed, but he lived in peoples heart and created a movement to fight against injustice around the world",
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
                                            answer_5 = val;
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
                                              if (answer_5.toLowerCase() ==
                                                  "george floyd") {
                                                createlog("5", "100",
                                                    "Crossed Level5");

                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SixthPage(),
                                                  ),
                                                );
                                              } else {
                                                setState(() {
                                                  message =
                                                      answer_5 + "Is Incorrect";
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
