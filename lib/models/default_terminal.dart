import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/providers/prefs_provider.dart';
import 'package:terminev/providers/terminal_theme_provider.dart';
import 'package:terminev/providers/window_titlebar_provider.dart';
import 'package:terminev/services/backend.dart';
import 'package:xterm/xterm.dart';

final _theme = ProviderContainer().read(terminalThemeProvider);
final _prefs = ProviderContainer().read(preferencesProvider);
final _windowBar = ProviderContainer().read(windowTitleBarProvider);

Terminal defaultTerminal = Terminal(
  maxLines: 10000,
  theme: _theme.theme,
  platform: PlatformBehaviors.unix,
  backend: TerminalBackendX(
    pty: Pty.start(
      _prefs.defaultShell!,
      environment: {
        'TERM': 'xterm-256color',
      },
      workingDirectory: _prefs.defaultWorkingDirectory,
    ),
  ),
  onTitleChange: (value) {
    if (value == 'exit') {
      exit(0);
    }
    _windowBar.setCenter(
      Text(value),
    );
  },
);
