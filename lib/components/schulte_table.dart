import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schulte_table/components/stopwatch.dart';
import 'package:schulte_table/context/sculte_table_context.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'schulte_cell.dart';

class SchulteTable extends StatefulWidget {
  final GameModeStrategy gameMode;
  final List<int> items;
  SchulteTable(this.gameMode, this.items);

  @override
  _SchulteTableState createState() =>
      _SchulteTableState(this.gameMode, this.items);
}

class _SchulteTableState extends State<SchulteTable> {
  final GameModeStrategy gameMode;
  final List<int> items;
  _SchulteTableState(this.gameMode, this.items);

  @override
  Widget build(BuildContext context) {
    return Consumer<SchulteTableContext>(
        builder: (context, schulteTableContext, _) {
      return ListView(shrinkWrap: true, children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).next +
                      ': ' +
                      schulteTableContext.nextValue.toString(),
                  style: TextStyle(fontSize: 22),
                ),
                StopWatch(() => gameMode.onStart(schulteTableContext)),
              ]),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.7,
            child: GridView.count(
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1,
              crossAxisCount: 5,
              children: List.generate(GameModeStrategy.CELL_COUNT, (index) {
                var itemValue = items[index];
                return SchulteCell(
                    itemValue,
                    schulteTableContext.items[itemValue],
                    () => this
                        .gameMode
                        .eventHandler(itemValue, schulteTableContext));
              }),
            ))
      ]);
    });
  }
}
