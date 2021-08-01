import 'package:api_generator/src/generatables/parameter_generatable.dart';
import 'package:api_generator/src/utils/element_name.dart';
import 'package:api_generator/src/utils/ref.dart';
import 'package:api_spec/api_spec.dart';

class GeneratableOperation {
  final String method;
  final String operationId;
  final List<GeneratableParameter> parameters;

  const GeneratableOperation._({
    required this.method,
    required this.operationId,
    required this.parameters,
  });

  factory GeneratableOperation.from(
    ElementName path,
    String method,
    Operation operation, Ref<String> route,
  ) {
    late String name;
    if (operation.operationId != null) {
      name = ElementName.interpret(operation.operationId!).toCamelCase();
    } else {
      name = method + path.toPascalCase();
    }

    return GeneratableOperation._(
      method: method,
      operationId: name,
      parameters: operation.parameters
              ?.map((e) => GeneratableParameter.from(route, e))
              .toList() ??
          [],
    );
  }
}
