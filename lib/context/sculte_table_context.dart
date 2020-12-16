import 'package:flutter/foundation.dart';

class SchulteTableCellState {
  final int value;
  bool visible;
  bool showValue;
  bool focused;
  bool popped;
  bool inAction;
  Duration selectDuration;

  SchulteTableCellState(
      this.value, this.visible, this.showValue, this.focused, this.popped,
      [this.inAction = false]);
}

class SchulteTableContext extends ChangeNotifier {
  Map<int, SchulteTableCellState> _items = new Map();
  int _nextValue = 1;
  bool _started = false;
  bool _finished = false;
  Duration _score;

  Map<int, SchulteTableCellState> get items => _items;
  int get nextValue => _nextValue;
  bool get started => _started;
  bool get finished => _finished;
  Duration get score => _score;

  SchulteTableContext(List<int> items) {
    items.forEach((element) {
      _items[element] = SchulteTableCellState(element, true, true, true, false);
    });
  }

  set itemState(SchulteTableCellState state) {
    _items.update(state.value, (item) => state);
    notifyListeners();
  }

  set nextValue(int value) {
    _nextValue = value;
    notifyListeners();
  }

  set started(bool isStarted) {
    _started = isStarted;
    notifyListeners();
  }

  set finished(bool isFinished) {
    _finished = isFinished;
    notifyListeners();
  }

  set score(Duration score) {
    _score = score;
    notifyListeners();
  }
}
