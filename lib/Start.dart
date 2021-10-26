import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syoogle/Pages/firstpage.dart';
import 'package:syoogle/logs.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final _formKey = GlobalKey<FormState>();
  String name, code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(1.0), BlendMode.softLight),
                image: AssetImage(
                  "assets/start.jpeg",
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text(
                  'Syoogle @ SynTech-X \'20 - \'21',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  'Escape 2020',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 100.0,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Form(
                    key: _formKey,
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? "No STX No Entry" : null,
                              onChanged: (val) {
                                name = val;
                              },
                              decoration: InputDecoration(
                                labelText: "STX No.",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? "No Code No Entry" : null,
                              onChanged: (val) {
                                code = val;
                              },
                              decoration: InputDecoration(
                                labelText: "Your Code Here",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Let's Go"),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString("stx", name);
                                  prefs.setString("code", code);
                                  createlog("0", "0", "LoggedIn");
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FirstPage(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
