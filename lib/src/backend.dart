import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_pty/flutter_pty.dart';
import 'package:xterm/terminal/terminal_backend.dart';

class TerminalBackendX extends TerminalBackend {
  Pty pty;

  TerminalBackendX({required this.pty}) : super();

  final _outStream = StreamController<String>();

  @override
  Future<int> get exitCode => pty.exitCode;

  @override
  void init() {
    pty.output.cast<List<int>>().transform(const Utf8Decoder()).listen((text) {
      _outStream.sink.add(text);
    });
  }

  @override
  Stream<String> get out => _outStream.stream;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    pty.resize(height, width);
  }

  @override
  void write(String input) {
    if (input.isEmpty) {
      return;
    }
    if (input == '\r') {
      pty.write(const Utf8Encoder().convert('\r'));
    } else if (input.codeUnitAt(0) == 127) {
      pty.write(const Utf8Encoder().convert('\b \b'));
    } else {
      pty.write(const Utf8Encoder().convert(input));
    }
  }

  @override
  void terminate() {
    _outStream.close();
    pty.kill(ProcessSignal.sigterm);
  }

  @override
  void ackProcessed() {
    return;
  }
}
