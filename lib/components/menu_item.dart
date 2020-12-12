import 'package:flutter/material.dart';
import 'package:schulte_table/components/schulte_table.dart';
import 'package:schulte_table/enums/game_mode.dart';
import '../game/game.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';

class MenuItem extends StatelessWidget {
  final GameModeStrategy gameMode;

  MenuItem(GameMode gameMode) : this.gameMode = Game.getGameMode(gameMode);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SchulteTable(this.gameMode)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              gameMode.getName(context),
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
