import 'package:api_generator/src/generatables/parameter_generatable.dart';
import 'package:api_generator/src/utils/element_name.dart';
import 'package:api_generator/src/utils/ref.dart';
import 'package:api_spec/api_spec.dart';
import 'operation_generatable.dart';

class GeneratablePath {
  GeneratablePath._(
      {required this.uri, required this.operations, required this.parameters});

  final Uri uri;
  final List<GeneratableOperation> operations;
  final List<GeneratableParameter> parameters;

  String get name => uri.pathSegments.first;

  factory GeneratablePath.from(Path path) {
    final uri = Uri.parse(path.path);

    /// Will have to work on it no producing correct in some cases.
    final name = ElementName(uri.pathSegments);
    final pathRef = Ref(path.path);

    return GeneratablePath._(
        uri: uri,
        operations: [
          if (path.get != null)
            GeneratableOperation.from(name, 'get', path.get!, pathRef),
          if (path.put != null)
            GeneratableOperation.from(name, 'put', path.put!, pathRef),
          if (path.post != null)
            GeneratableOperation.from(name, 'post', path.post!, pathRef),
          if (path.delete != null)
            GeneratableOperation.from(name, 'delete', path.delete!, pathRef),
          if (path.options != null)
            GeneratableOperation.from(name, 'options', path.options!, pathRef),
          if (path.head != null)
            GeneratableOperation.from(name, 'head', path.head!, pathRef),
          if (path.patch != null)
            GeneratableOperation.from(name, 'patch', path.patch!, pathRef),
          if (path.trace != null)
            GeneratableOperation.from(name, 'trace', path.trace!, pathRef),
        ],
        parameters: path.parameters
                ?.map((e) => GeneratableParameter.from(pathRef, e))
                .toList() ??
            []
        );
  }
}
