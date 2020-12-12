import 'package:schulte_table/game/game_mode_strategy.dart';

import 'package:schulte_table/enums/game_mode.dart';
import 'package:schulte_table/game/modes/memory_mode_strategy.dart';

class Game {
  Game();

  static GameModeStrategy getGameMode(GameMode mode) {
    switch (mode) {
      case GameMode.reaction:
        return MemoryModeStrategy();
      case GameMode.classic_light:
        return MemoryModeStrategy();
      case GameMode.classic_light_reverse:
        return MemoryModeStrategy();
      case GameMode.classic_light_original:
        return MemoryModeStrategy();
      case GameMode.classic_light_original_reverse:
        return MemoryModeStrategy();
      case GameMode.memory:
        return MemoryModeStrategy();
    }

    return MemoryModeStrategy();
  }
}
