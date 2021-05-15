import 'package:flutter/material.dart';
import 'package:sentimojigui/class_resulting.dart';

class PageDataText extends StatelessWidget {
  final SentimentBreakdown sentiment;

  const PageDataText({Key key, this.sentiment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: SizedBox(
            height: 50,
            //width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10), child: Text(sentiment.emoji)),
                Expanded(
                    child: Text(
                  sentiment.text,
                  overflow: TextOverflow.fade,
                ))
              ],
            )));
  }
}
