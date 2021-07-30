import 'dart:io';

import 'package:api_spec/api_spec.dart';
import 'package:api_spec/src/io/api_spec_reader.dart';
import 'package:api_spec_generator/src/dart/dart_client.dart';
import 'package:api_spec_generator/src/generatables/api_spec_generatable.dart';

class ApiSpecGenerator {
  static void generate(final ApiSpecification? specification) {
    final generatable = GeneratableApiSpecification.from(specification!);
    DartClientGenerator().generate(generatable);
  }
}

void main() {
  final spec = ApiSpecificationReader.readFile(File(
    r'C:\Users\arish\IdeaProjects\api_specs\api_spec_generator\petstore.json',
  ));

  ApiSpecGenerator.generate(spec);
}
