import 'dart:collection';

import 'package:api_spec/api_spec.dart';
import 'package:api_spec_generator/src/generatables/api_spec_generatable.dart';
import 'package:api_spec_generator/src/generatables/path_generatable.dart';

class DartClientGenerator {
  final _progress = SplayTreeMap<String, dynamic>();

  void generate(GeneratableApiSpecification specification) {
    final paths = _groupPaths(specification.paths);

    for (final path in paths.entries) {
      _generatePath(path.value);
    }
  }
}

void _generatePath(GeneratablePath path) {
  final buffer = StringBuffer();

  for (final operation in path.operations) {
    buffer.writeln('void ${operation.operationId}() {');
    buffer.writeln('');
    buffer.writeln('}');
  }

  print(buffer);

}

Map<String, GeneratablePath> _groupPaths(List<GeneratablePath> paths) {
  final map = <String, GeneratablePath>{};
  for (final item in paths) {
    map[item.name] = item;
  }

  return map;
}
