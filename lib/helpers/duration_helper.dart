String getReadebleDuration(Duration duration) {
  String leastTwoDigits(String value) =>
      value.length > 1 ? value : value.padLeft(2, '0');
  String minutes = leastTwoDigits((duration.inMinutes % 60).floor().toString());
  String seconds = leastTwoDigits((duration.inSeconds % 60).floor().toString());
  String milliseconds =
      leastTwoDigits((duration.inMilliseconds % 1000).floor().toString());
  return "$minutes:$seconds:$milliseconds";
}
