import 'package:shared_preferences/shared_preferences.dart';

void setScore(int score) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> stringScores = prefs.getStringList('scores') ?? new List();
  stringScores.add(score.toString());
  await prefs.setStringList('scores', stringScores);
}

void removeAll() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('scores');
}

Future<int> getBestScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> stringScores = prefs.getStringList('scores') ?? new List();
  if (stringScores.length > 0) {
    List<int> scores = stringScores.map((e) => int.parse(e)).toList();
    scores.sort();
    return Future.value(scores.first);
  }

  return null;
}
