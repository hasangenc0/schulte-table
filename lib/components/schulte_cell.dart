import 'package:flutter/material.dart';
import 'package:schulte_table/context/sculte_table_context.dart';

class SchulteCell extends StatelessWidget {
  final int value;
  final SchulteTableCellState state;
  final void Function() onTapToCell;
  SchulteCell(this.value, this.state, this.onTapToCell);

  Color getColor() {
    if (state.focused) {
      return Colors.redAccent;
    }
    return state.visible ? Colors.blueAccent : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapToCell,
        child: Container(
          decoration: BoxDecoration(
            color: getColor(),
            border: state.visible
                ? Border(
                    top: BorderSide(width: 1.0, color: Colors.white),
                    left: BorderSide(width: 1.0, color: Colors.white),
                    right: BorderSide(width: 1.0, color: Colors.lightBlue),
                    bottom: BorderSide(width: 1.0, color: Colors.lightBlue),
                  )
                : null,
          ),
          child: Center(
              child: Text(
            ((state.visible && state.showValue) || state.focused)
                ? value.toString()
                : '',
            style: TextStyle(fontSize: 24),
          )),
        ));
  }
}
