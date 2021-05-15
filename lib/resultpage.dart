import 'package:flutter/material.dart';

import 'class_resulting.dart';
import 'staticSlides.dart';

class InfoPage extends StatefulWidget {
  final PrasedResult results;

  const InfoPage({Key key, this.results}) : super(key: key);

  @override
  InfoPageState createState() => InfoPageState(results);
}

class InfoPageState extends State<InfoPage> {
  final PrasedResult results;

  InfoPageState(this.results);

  @override
  Widget build(BuildContext context) {
    List<Widget> containersList = [];

    results.sentimentsList.forEach((element) {
      containersList.add(Container(
          padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: PageDataText(sentiment: element)));
    });

    return Scaffold(
      appBar: AppBar(title: Text(results.overallEmoji), centerTitle: true),
      body: Container(
          color: Colors.blueGrey[500],
          child: Center(child: ListView(children: containersList))),
    );
  }
}
