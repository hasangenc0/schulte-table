import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'menu_item.dart';
import '../enums/game_mode.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).homePageTitle),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: ListView(children: <Widget>[
              Center(
                  child: RichText(
                      text: TextSpan(
                text: AppLocalizations.of(context).chooseGameMode,
                style: new TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ))),
              Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    children: List.generate(6, (index) {
                      return Container(child: MenuItem(GameMode.values[index]));
                    }),
                  ))
            ]),
          ),
        ));
  }
}
