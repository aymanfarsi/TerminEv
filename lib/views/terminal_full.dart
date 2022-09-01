import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terminev/src/bindings.dart';
import 'package:terminev/src/terminals.dart';
import 'package:terminev/states/state_vars.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/theme/terminal_style.dart';

class TerminalFull extends StatefulWidget {
  const TerminalFull({Key? key}) : super(key: key);

  @override
  State<TerminalFull> createState() => _TerminalFullState();
}

class _TerminalFullState extends State<TerminalFull> {
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: customBindings,
      child: Focus(
        autofocus: true,
        focusNode: FocusNode(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Terminal'),
            actions: [
              IconButton(
                onPressed: () {
                  fontSizeObs.value = fontSizeObs.value - 5;
                },
                icon: const Icon(Icons.exposure_minus_1),
              ),
              IconButton(
                onPressed: () {
                  fontSizeObs.value = fontSizeObs.value + 5;
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Obx(
            () => TerminalView(
              padding: 7.0,
              autofocus: true,
              terminal: terminals.first,
              focusNode: FocusNode(),
              style: TerminalStyle(
                fontSize: fontSizeObs.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
