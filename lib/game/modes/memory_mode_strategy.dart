import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schulte_table/components/schulte_table.dart';
import 'package:schulte_table/context/sculte_table_context.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemoryModeStrategy implements GameModeStrategy {
  String getName(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeTitle;

  String getDescriptionText(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeDescription;

  void eventHandler(int cellValue, SchulteTableContext schulteTableContext) {
    schulteTableContext.itemState =
        SchulteTableCellState(cellValue, false, false, false);
  }

  Widget getSchulteTable(BuildContext context) {
    List<int> items = GameModeStrategy.getTableCellValues();

    return ChangeNotifierProvider(
      create: (context) => SchulteTableContext(items),
      child: SchulteTable(this, items),
    );
  }
}
