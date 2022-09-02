import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xterm/xterm.dart';
import 'package:flutter/widgets.dart';
import 'package:terminev/models/default_terminal.dart';

class TerminalProvider extends ChangeNotifier {
  Map<FocusNode, Terminal> terminals;

  TerminalProvider()
      : terminals = {
          FocusNode(): defaultTerminal,
        },
        super();

  void addTerminal(Terminal terminal, FocusNode focusNode) {
    terminals[focusNode] = terminal;
    notifyListeners();
  }

  void removeTerminal(FocusNode focusNode) {
    terminals.remove(focusNode);
    notifyListeners();
  }
}

final terminalProvider = ChangeNotifierProvider((ref) {
  return TerminalProvider();
});
