import 'dart:io';

import 'package:yaml/yaml.dart';

Future<void> loadConfig() async {
  String configFile = '${Platform.environment['HOME']!}/.config/fterm';
  Directory dir = await Directory(configFile).create();
  configFile = '$configFile/config.yaml';
  File file = File(configFile);
  if (!(file.existsSync())) {
    await file.create();
    String defaultConfig = '''
# default fterm config

shell: zsh

font_size: 16


''';
    await file.writeAsString(defaultConfig);
    return;
  }

  final configPrefs = loadYaml(configFile);
  // TODO load config
}
