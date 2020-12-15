import 'package:flutter/material.dart';
import 'package:schulte_table/components/description_text.dart';
import 'package:schulte_table/constants/schulte_table_constants.dart';
import 'package:schulte_table/context/sculte_table_context.dart';
import 'package:schulte_table/helpers/shuffle_array_helper.dart';

abstract class GameModeStrategy {
  static const CELL_COUNT = TABLE_ITEM_COUNT;

  String getName(BuildContext context);
  Widget getSchulteTable(BuildContext context);
  String getDescriptionText(BuildContext context);
  void eventHandler(int cellValue, SchulteTableContext schulteTableContext);
  void onStart(SchulteTableContext schulteTableContext);

  static List<int> getTableCellValues() {
    return shuffleArray(1, GameModeStrategy.CELL_COUNT);
  }

  static Widget getDescription(String description) {
    return DescriptionText(description);
  }
}
