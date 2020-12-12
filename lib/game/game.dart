import 'package:schulte_table/game/game_mode_strategy.dart';

import 'package:schulte_table/enums/game_mode.dart';
import 'package:schulte_table/game/modes/memory_mode_strategy.dart';

class Game {
  Game();

  void startMode(GameMode mode) {
    switch (mode) {
      case GameMode.memory:
        MemoryModeStrategy().announce('as');
    }
  }
}
