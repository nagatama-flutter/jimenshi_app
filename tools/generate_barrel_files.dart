import 'dart:io';

/// Execute this script via Melos.
void main(List<String> args) {
  final pwd = Platform.environment['PWD'];
  final libDir = Directory('${pwd}/lib');

  if (!libDir.existsSync()) {
    print('[FAILURE] app directory does not exist');
    return;
  }

  libDir.listSync().forEach(_createBarrelFile);
}

/// Create barrel file for the given directory
void _createBarrelFile(FileSystemEntity entry) {
  if (entry.isNotDirectory) {
    return;
  }

  final directory = Directory(entry.path);
  final barrelFile = File('${directory.path}.dart');

  final exportStatements = _retrieveExportStatements(directory.listSync());

  barrelFile.openWrite()
    ..write('${exportStatements.join('\n')}\n')
    ..close();
  print('Generated barrel file: ${barrelFile.path}');
}

/// Retrieve export statements for the given directories
List<String> _retrieveExportStatements(List<FileSystemEntity> entries) {
  final exportStatements = <String>[];

  for (final entry in entries) {
    if (entry.isDirectory) {
      _createBarrelFile(entry);
      continue;
    }

    if (entry.isIgnoreFile || entry.isNotDartFile) {
      continue;
    }

    final dirName = entry.parent.path.split('/').last;
    exportStatements.add("export '$dirName/${entry.uri.pathSegments.last}';");
  }

  exportStatements.sort();
  return exportStatements;
}

/// Extension on [FileSystemEntity] to check if it is a directory
extension on FileSystemEntity {
  bool get isDirectory => statSync().type == FileSystemEntityType.directory;

  bool get isNotDirectory => statSync().type != FileSystemEntityType.directory;

  bool get isNotDartFile => !path.endsWith('.dart');

  bool get isIgnoreFile =>
      ['.g.dart', '.freezed.dart', '.gr.dart'].any((e) => path.endsWith(e));
}
