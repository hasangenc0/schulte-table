import 'package:flutter/material.dart';
import 'package:schulte_table/game/game_mode_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemoryModeStrategy implements GameModeStrategy {
  String getName(BuildContext context) =>
      AppLocalizations.of(context).memoryGameModeTitle;
}
