import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schulte_table/context/sculte_table_context.dart';
import 'package:schulte_table/helpers/duration_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schulte_table/helpers/shared_prefs_helper.dart';

class GameResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SchulteTableContext>(
        builder: (context, schulteTableContext, _) {
      String readableScore = getReadebleDuration(schulteTableContext.score);
      return FutureBuilder(
          future: getBestScore(),
          builder: (BuildContext context, snapshot) {
            int bestScore = snapshot.data;
            String readableBestScore = bestScore != null
                ? getReadebleDuration(Duration(milliseconds: bestScore))
                : readableScore;
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: [
                  Text(AppLocalizations.of(context).finished,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 20)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppLocalizations.of(context).scoreResult),
                        TextSpan(
                          text: readableScore,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(text: AppLocalizations.of(context).bestScore),
                        TextSpan(
                          text: readableBestScore,
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
          });
    });
  }
}
