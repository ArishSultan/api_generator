import 'dart:io';
import 'dart/dart_client.dart';
import 'package:api_spec/api_spec.dart';
import 'generatables/api_spec_generatable.dart';
import 'package:api_spec/src/io/api_spec_reader.dart';

class ApiSpecGenerator {
  static void generate(final ApiSpecification? specification) {
    final generatable = GeneratableApiSpecification.from(specification!);
    DartClientGenerator().generate(generatable);
  }
}

void main() {
  final spec = ApiSpecificationReader.readFile(File(
    r'/home/zainkhan/IdeaProjects/api_generator/petstore.json',
  ));

  ApiSpecGenerator.generate(spec);
}
