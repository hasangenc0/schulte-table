import 'package:flutter/material.dart';
import 'package:schulte_table/components/schulte_cell.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemoryModeStrategy implements GameModeStrategy {
  String getName(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeTitle;

  String getDescriptionText(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeDescription;

  Widget getSchulteTable(BuildContext context) {
    List<int> items = GameModeStrategy.getTableCellValues();

    return Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.7,
        child: GridView.count(
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
          crossAxisCount: 5,
          children: List.generate(GameModeStrategy.CELL_COUNT, (index) {
            return SchulteCell(items[index]);
          }),
        ));
  }
}
