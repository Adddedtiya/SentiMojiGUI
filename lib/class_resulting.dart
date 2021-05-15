import 'dart:convert';

class SentimentBreakdown {
  String emoji;
  String text;

  SentimentBreakdown(Map<Object, dynamic> x) {
    emoji = x['Emoji'];
    text = x['Text'];
  }
}

class PrasedResult {
  List<SentimentBreakdown> sentimentsList = [];
  List<String> mainTalkingPoints = [];
  String overallEmoji = "?";

  PrasedResult(String body) {
    Map<Object, Object> keyResult = jsonDecode(body);

    List<dynamic> sentimentBreakdown = keyResult['Sentiments Breakdown'];

    sentimentBreakdown.forEach((element) {
      sentimentsList.add(SentimentBreakdown(element));
    });

    List<dynamic> talkspoint = keyResult['Talking Points'];
    talkspoint.forEach((element) {
      mainTalkingPoints.add(element.toString());
    });

    overallEmoji = keyResult['Overall Sentiment'];
  }
}
