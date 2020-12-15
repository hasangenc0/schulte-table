import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StopWatch extends StatefulWidget {
  final Function onStart;
  StopWatch(this.onStart);
  @override
  _StopWatchState createState() => _StopWatchState(onStart);
}

class _StopWatchState extends State<StopWatch> {
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String minutesStr = '00';
  String secondsStr = '00';
  String mSecondsStr = '00';
  Function onStart;

  _StopWatchState(this.onStart);

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(milliseconds: 100);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  void resetStopWatch() {
    timerSubscription.cancel();
    timerStream = null;
  }

  void startStopWatch() {
    timerStream = stopWatchStream();
    timerSubscription = timerStream.listen((int newTick) {
      var msTick = newTick * 100;
      setState(() {
        minutesStr = Duration(minutes: ((msTick / (1000 * 60))).floor())
            .inMinutes
            .toString()
            .padLeft(2, '0');
        secondsStr = Duration(seconds: ((msTick / 1000) % 60).floor())
            .inSeconds
            .toString()
            .padLeft(2, '0');
        mSecondsStr = Duration(milliseconds: msTick % 1000)
            .inMilliseconds
            .toString()
            .padLeft(3, '0');
      });
    });
  }

  @override
  void initState() {
    this.startStopWatch();
    Future.delayed(Duration.zero, () async {
      this.onStart();
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.resetStopWatch();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context).score + ': ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text: "$minutesStr:$secondsStr:$mSecondsStr",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
