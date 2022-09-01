import 'dart:io';

List<String> getNativeShells() {
  if (Platform.isWindows) {
    return ["cmd", "powershell"];
  }
  ProcessResult process = Process.runSync("chsh", ["-l"]);
  Set<String> shells = (process.stdout as String)
      .split("\n")
      .map((shell) => shell.split("/").last)
      .where((shell) => shell.isNotEmpty)
      .toSet();
  shells.remove("git-shell");
  return List.castFrom<dynamic, String>(shells.toList());
}
