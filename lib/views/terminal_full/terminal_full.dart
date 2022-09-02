import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/models/default_terminal.dart';
import 'package:terminev/views/common/tabs_bar.dart';
import 'package:xterm/theme/terminal_style.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:terminev/providers/prefs_provider.dart';
import 'package:terminev/providers/terminal_provider.dart';

class TerminalFull extends HookConsumerWidget {
  const TerminalFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PreferencesProvider prefs = ref.watch(preferencesProvider);
    final TerminalProvider terminals = ref.watch(terminalProvider);

    final activeIndex = useState(0);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          CallbackShortcuts(
        bindings: {
          LogicalKeySet(
            LogicalKeyboardKey.control,
            LogicalKeyboardKey.keyF,
          ): () {
            print('crtl + F');
          },
          LogicalKeySet(
            LogicalKeyboardKey.control,
            LogicalKeyboardKey.keyT,
          ): () {
            // terminals.addTerminal(
            //   defaultTerminal,
            //   FocusNode(),
            // );
            // activeIndex.value = 1;
          },
          LogicalKeySet(
            LogicalKeyboardKey.control,
            LogicalKeyboardKey.keyW,
          ): () {
            print('Remove tab');
          },
        },
        child: Focus(
          autofocus: true,
          focusNode: FocusNode(),
          child: Scaffold(
            // appBar: const WindowTitleBar(),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  // const TabsBar(),
                  Expanded(
                    child: terminals.terminals.entries
                        .map(
                          (tab) => TerminalView(
                            padding: 7.0,
                            autofocus: true,
                            terminal: tab.value,
                            focusNode: tab.key,
                            style: TerminalStyle(
                              fontSize: prefs.fontSize,
                            ),
                            enableSuggestions: true,
                          ),
                        )
                        .toList()[activeIndex.value],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
