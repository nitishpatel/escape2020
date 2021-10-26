import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void createlog(String currentlevel, String points, String reason) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var stx = prefs.get("stx");
  var code = prefs.get("code");
  print(stx);
  print(code);
  var response = await http
      .post(Uri.parse("https://nitishpatel.herokuapp.com/api/logs/"), body: {
    "name": "SYOOGLE",
    "stx": stx,
    "code": code,
    "currentlevel": currentlevel,
    "points": points,
    "reason": reason,
  });
  print(response.body);
}
