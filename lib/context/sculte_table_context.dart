import 'package:flutter/foundation.dart';

class SchulteTableCellState {
  final int value;
  bool visible;
  bool showValue;
  bool focused;
  bool popped;
  Duration selectDuration;

  SchulteTableCellState(
      this.value, this.visible, this.showValue, this.focused, this.popped);
}

class SchulteTableContext extends ChangeNotifier {
  Map<int, SchulteTableCellState> _items = new Map();
  int _nextValue = 1;

  Map<int, SchulteTableCellState> get items => _items;
  int get nextValue => _nextValue;

  SchulteTableContext(List<int> items) {
    items.forEach((element) {
      _items[element] = SchulteTableCellState(element, true, true, true, false);
    });
  }

  set itemState(SchulteTableCellState state) {
    _items.update(
        state.value,
        (item) => SchulteTableCellState(item.value, state.visible,
            state.showValue, state.focused, state.popped));
    notifyListeners();
  }

  set nextValue(int value) {
    _nextValue = value;
    notifyListeners();
  }
}
