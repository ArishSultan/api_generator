import 'package:api_generator/src/utils/ref.dart';
import 'package:api_spec/api_spec.dart';

class GeneratableParameter {
  final String name;
  final bool required;
  final ParameterIn $in;
  final int index;
  final Ref<String> path;

  final dynamic schema;
  final ParameterStyle? style;
  final String? description;
  final bool? deprecated;
  final bool? allowEmptyValue;
  final bool? explode;
  final bool? allowReserved;
  final dynamic example;
  final dynamic examples;
  final Map<String, dynamic>? content;

  GeneratableParameter._({
    required this.name,
    required this.$in,
    required this.required,
    required this.index,
    required this.path,
    this.style,
    this.schema,
    this.allowEmptyValue,
    this.allowReserved,
    this.content,
    this.deprecated,
    this.description,
    this.example,
    this.examples,
    this.explode,
  });

  factory GeneratableParameter.from(Ref<String> path, Parameter parameter) {
    var parameterIndexes = Path.extractParameter(path.value);

    return GeneratableParameter._(
      name: parameter.name,
      $in: parameter.$in,
      required: parameter.required,
      index: parameterIndexes[parameter.name] ?? 0,
      path: path,
      schema: parameter.schema,
      style: parameter.style,
      allowEmptyValue: parameter.allowEmptyValue,
      allowReserved: parameter.allowReserved,
      content: parameter.content,
      deprecated: parameter.deprecated,
      description: parameter.description,
      example: parameter.example,
      examples: parameter.examples,
      explode: parameter.explode,
    );
  }
}
