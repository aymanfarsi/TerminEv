import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/widgets.dart';
import 'package:xterm/theme/terminal_theme.dart';
import 'package:xterm/theme/terminal_themes.dart';

class TerminalThemeProvider extends ChangeNotifier {
  TerminalTheme theme;

  TerminalThemeProvider()
      : theme = TerminalThemes.defaultTheme,
        super();

  void setTheme(TerminalTheme newTheme) {
    theme = newTheme;
    notifyListeners();
  }
}

final terminalThemeProvider = ChangeNotifierProvider((ref) {
  return TerminalThemeProvider();
});
