import 'package:api_spec/api_spec.dart';
import 'package:api_spec_generator/src/utils/element_name.dart';

class GeneratableOperation {
  final String method;
  final String operationId;

  const GeneratableOperation._({
    required this.method,
    required this.operationId,
  });

  factory GeneratableOperation.from(
    ElementName path,
    String method,
    Operation operation,
  ) {
    late String name;
    if (operation.operationId != null) {
      name = ElementName.interpret(operation.operationId!).toCamelCase();
    } else {
      name = method + path.toPascalCase();
    }

    return GeneratableOperation._(method: method, operationId: name);
  }
}
