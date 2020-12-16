import 'package:shared_preferences/shared_preferences.dart';

setScore(int score) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> stringScores = prefs.getStringList('scores') ?? new List();
  stringScores.add(score.toString());
  await prefs.setStringList('scores', stringScores);
}

getBestScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> stringScores = prefs.getStringList('scores') ?? new List();
  List<int> scores = stringScores.map((e) => int.parse(e));
  scores.sort();
  return scores.first;
}
