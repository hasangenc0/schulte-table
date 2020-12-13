import 'package:flutter/material.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SchulteTable extends StatelessWidget {
  final GameModeStrategy gameMode;
  SchulteTable(this.gameMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).homePageTitle),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              Center(
                  child: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context).mode,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' ' + gameMode.getName(context),
                        style: TextStyle(color: Colors.orange)),
                  ],
                ),
              )),
              gameMode.getSchulteTable(context)
            ],
          ),
        ));
  }
}
