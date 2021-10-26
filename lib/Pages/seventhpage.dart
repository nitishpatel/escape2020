import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syoogle/Pages/eigthpage.dart';
import 'package:syoogle/logs.dart';

class SeventhPage extends StatefulWidget {
  @override
  _SeventhPageState createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {
  final _formKey = GlobalKey<FormState>();
  String answer_7;
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
                    "https://images.unsplash.com/photo-1529390079861-591de354faf5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80",
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage("assets/1.jpeg"),
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                      Image(
                                        image: AssetImage("assets/2.jpeg"),
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                      Image(
                                        image: AssetImage("assets/3.jpeg"),
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                    ],
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
                                            answer_7 = val;
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Your Answer",
                                          ),
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
                                              if (answer_7.toLowerCase() ==
                                                  "national education policy") {
                                                createlog("7", "100",
                                                    "Crossed Level7");

                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EightPage(),
                                                  ),
                                                );
                                              } else {
                                                setState(() {
                                                  message =
                                                      answer_7 + "Is Incorrect";
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
