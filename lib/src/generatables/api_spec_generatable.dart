import 'package:api_spec/api_spec.dart';
import 'package:api_spec_generator/src/generatables/path_generatable.dart';

class GeneratableApiSpecification {
  final List<GeneratablePath> paths;
  GeneratableApiSpecification._({required this.paths});

  factory GeneratableApiSpecification.from(ApiSpecification specification) {
    return GeneratableApiSpecification._(
      paths: specification.paths.map((e) => GeneratablePath.from(e)).toList()
    );
  }
}