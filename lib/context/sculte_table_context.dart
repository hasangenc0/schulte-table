import 'package:flutter/foundation.dart';

class SchulteTableCellState {
  final int value;
  bool visible = true;
  bool showValue = true;
  bool focused = true;

  SchulteTableCellState(this.value, this.visible, this.showValue, this.focused);
}

class SchulteTableContext extends ChangeNotifier {
  Map<int, SchulteTableCellState> _items = new Map();

  Map<int, SchulteTableCellState> get items => _items;

  SchulteTableContext(List<int> items) {
    items.forEach((element) {
      _items[element] = SchulteTableCellState(element, true, true, true);
    });
  }

  set itemState(SchulteTableCellState state) {
    _items.update(
        state.value,
        (item) => SchulteTableCellState(
            item.value, state.visible, state.showValue, state.focused));
    notifyListeners();
  }
}
