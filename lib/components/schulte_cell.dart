import 'package:flutter/material.dart';
import 'package:schulte_table/context/sculte_table_context.dart';

class SchulteCell extends StatelessWidget {
  final int value;
  final SchulteTableCellState state;
  final void Function() onTapToCell;
  SchulteCell(this.value, this.state, this.onTapToCell);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.onTapToCell();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.white),
              left: BorderSide(width: 1.0, color: Colors.white),
              right: BorderSide(width: 1.0, color: Colors.black),
              bottom: BorderSide(width: 1.0, color: Colors.black),
            ),
          ),
          child: Center(
              child: Text(
            state.visible ? value.toString() : '',
            style: TextStyle(fontSize: 24),
          )),
        ));
  }
}
