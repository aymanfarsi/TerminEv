import 'dart:io';

import 'package:flutter_pty/flutter_pty.dart';
import 'package:terminev/src/backend.dart';
import 'package:terminev/states/state_vars.dart';
import 'package:terminev/utils/native_shells.dart';
import 'package:xterm/xterm.dart';

final List<String> shells = getNativeShells();

List<Terminal> terminals = [
  Terminal(
    maxLines: 10000,
    backend: TerminalBackendX(
      pty: Pty.start(
        defaultShellObs == null ? shells.last : defaultShellObs!.value,
        environment: {
          'TERM': 'xterm-256color',
        },
        workingDirectory: defaultWorkingDirectoryObs != null
            ? defaultWorkingDirectoryObs!.value
            : null,
      ),
    ),
    platform: PlatformBehaviors.unix,
    onTitleChange: (value) {
      if (value == 'exit') {
        exit(0);
      }
    },
  ),
];
