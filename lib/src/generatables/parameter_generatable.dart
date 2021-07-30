import 'package:api_spec/api_spec.dart';
import 'package:api_spec_generator/src/utils/ref.dart';

class ParameterGenerator {
  final String name;

  ParameterGenerator._({required this.name});

  factory ParameterGenerator.from(Ref<String> path, Parameter parameter) {
    return ParameterGenerator._(name: parameter.name ?? 'TODO: Fix this');
  }
}