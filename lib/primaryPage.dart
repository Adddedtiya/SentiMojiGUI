import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sentimojigui/resultpage.dart';

import 'class_resulting.dart';
//import 'staticSlides.dart';

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  TextEditingController textControl = new TextEditingController();
  String _buttonText = "Analise";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Sentiment Emoji")),
        body: Container(
            color: Colors.blueGrey[600],
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                //Stuff here!
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textControl,
                      showCursor: true,
                      maxLines: 10,
                    )),
                SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    child: Container(
                        color: Colors.lightBlue[400],
                        child: TextButton(
                          onPressed: sendTextData,
                          child: Text(
                            _buttonText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ))),

                //Test
              ],
            )));
  }

  bool pressed = false;

  void sendTextData() async {
    if (pressed) {
      return;
    }
    pressed = true;

    setState(() {
      _buttonText = "Loading.......";
    });

    String url =
        "https://sentimojifunction20210427113625.azurewebsites.net/api/SentiMoji";

    //data beeing send
    var jsonData =
        jsonEncode(<String, Object>{'Text': textControl.text, 'security': []});

    //sends the data and wait for a respose...
    var serverResponse = await http
        .post(url, body: jsonData)
        .timeout(Duration(seconds: 10), onTimeout: () {
      var tempResp = http.Response(
          "{'detail' :  'No Network Connection to the server' }", 404);
      return tempResp;
    });

    setState(() {
      _buttonText = "Analise";
    });

    if (serverResponse.statusCode == 200) {
      PrasedResult res = PrasedResult(serverResponse.body);
      InfoPage p = new InfoPage(results: res);
      pressed = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) => p));
    }
  }
}
