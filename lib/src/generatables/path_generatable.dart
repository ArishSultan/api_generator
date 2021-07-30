import 'package:api_spec/api_spec.dart';
import 'package:api_spec_generator/src/utils/element_name.dart';

import 'operation_generatable.dart';

class GeneratablePath {
  GeneratablePath._({required this.uri, required this.operations});

  final Uri uri;
  final List<GeneratableOperation> operations;

  String get name => uri.pathSegments.first;

  factory GeneratablePath.from(Path path) {
    final uri = Uri.parse(path.path);

    /// Will have to work on it no producing correct in some cases.
    final name = ElementName(uri.pathSegments);

    return GeneratablePath._(uri: uri, operations: [
      if (path.get != null) GeneratableOperation.from(name, 'get', path.get!),
      if (path.put != null) GeneratableOperation.from(name, 'put', path.put!),
      if (path.post != null)
        GeneratableOperation.from(name, 'post', path.post!),
      if (path.delete != null)
        GeneratableOperation.from(name, 'delete', path.delete!),
      if (path.options != null)
        GeneratableOperation.from(name, 'options', path.options!),
      if (path.head != null)
        GeneratableOperation.from(name, 'head', path.head!),
      if (path.patch != null)
        GeneratableOperation.from(name, 'patch', path.patch!),
      if (path.trace != null)
        GeneratableOperation.from(name, 'trace', path.trace!),
    ]);
  }
}
