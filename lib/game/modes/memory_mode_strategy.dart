import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schulte_table/components/schulte_table.dart';
import 'package:schulte_table/context/sculte_table_context.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemoryModeStrategy extends GameModeStrategy {
  String getName(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeTitle;

  String getDescriptionText(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeDescription;

  void eventHandler(int cellValue, SchulteTableContext schulteTableContext) {
    if (!schulteTableContext.started) {
      return;
    }

    var current = schulteTableContext.items[cellValue];

    if (current.inAction) {
      return;
    }

    bool isFirstCell = cellValue == 1;
    SchulteTableCellState previousValue =
        isFirstCell ? null : schulteTableContext.items[cellValue - 1];

    bool shouldSelected = isFirstCell || previousValue.popped;
    if (shouldSelected) {
      schulteTableContext.itemState =
          SchulteTableCellState(cellValue, false, false, false, true);
      schulteTableContext.nextValue = cellValue + 1;
      this.afterClick(schulteTableContext);
    }

    if (!shouldSelected) {
      schulteTableContext.itemState =
          SchulteTableCellState(cellValue, true, true, false, false, true);

      Future.delayed(Duration(seconds: 3), () {
        try {
          schulteTableContext.itemState = SchulteTableCellState(
              cellValue, true, false, false, false, false);
        } catch (Exception) {}
      });
    }
  }

  void onStart(SchulteTableContext schulteTableContext) {
    schulteTableContext.items.forEach((_, cellState) {
      schulteTableContext.itemState =
          SchulteTableCellState(cellState.value, true, true, false, false);
    });
    Future.delayed(Duration(seconds: 3), () {
      try {
        schulteTableContext.items.forEach((_, cellState) {
          schulteTableContext.itemState =
              SchulteTableCellState(cellState.value, true, false, false, false);
        });
        schulteTableContext.started = true;
      } catch (Exception) {}
    });
  }

  Widget getSchulteTable(BuildContext context) {
    List<int> items = GameModeStrategy.getTableCellValues();

    return ChangeNotifierProvider(
      create: (context) => SchulteTableContext(items),
      child: SchulteTable(this, items),
    );
  }
}
