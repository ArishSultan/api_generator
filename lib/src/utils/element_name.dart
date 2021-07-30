/// A class that represents a variable name.
///
/// A variable name is considered to be a collection of string that are combined
/// to form a new string that can be used as a variable name in different
/// programming language.
class ElementName {
  /// Creates an instance of [ElementName]
  const ElementName(this.parts) : assert(parts.length > 0);

  /// These are the atomic parts of name.
  final List<String> parts;

  /// Generates parts of name from raw string.
  ///
  /// For Example
  /// * `sample_name` will be interpreted as [sample, name];
  /// * `a very big name` will be interpreted as [a, very, big, name].
  factory ElementName.interpret(String name) {
    var parts = <String>[];
    if (name.isEmpty) parts.add(name);

    var allUpper = true;
    final buffer = StringBuffer();
    final codeUnits = name.codeUnits;

    for (var i = 0; i < codeUnits.length; ++i) {
      final unit = codeUnits[i];
      final isUpper = _isUpperCaseCharacter(unit);

      allUpper = allUpper && isUpper;
      if (_isSeparatorCharacter(unit)) {
        parts.add(buffer.toString().toLowerCase());
        buffer.clear();
        continue;
      } else if (isUpper && i != 0) {
        parts.add(buffer.toString().toLowerCase());
        buffer.clear();
      }

      buffer.write(String.fromCharCode(unit));
    }

    if (buffer.isNotEmpty) {
      parts.add(buffer.toString());
    }

    if (allUpper) {
      parts = [parts.join()];
    }

    return ElementName(parts);
  }

  /// Join's the [parts] to create a name that follows `snake_case` convention.
  /// This convention is mostly used in high level scripting languages like,
  /// python, julia, shell etc.
  ///
  /// Examples
  /// * [sample, name] will be converted to sample_name.
  /// * [another, sample, name] will be converted to another_sample_name.
  String toSnakeCase() => parts.join('_');

  /// Join's the [parts] to create a name that follows `kebab-case` convention.
  /// This convention is mostly used in markup languages like,
  /// JSON, xml, html, yaml etc.
  ///
  /// Examples
  /// * [sample, name] will be converted to sample-name.
  /// * [another, sample, name] will be converted to another-sample-name.
  String toKebabCase() => parts.join('-');

  /// Join's the [parts] to create a name that follows `camelCase` convention.
  /// This convention is mostly used for naming variables in high level OOP
  /// languages like,
  /// Java, C#, Dart, C++ etc.
  ///
  /// Examples
  /// * [sample, name] will be converted to sampleName.
  /// * [another, sample, name] will be converted to anotherSampleName.
  String toCamelCase() =>
      parts[0] +
          parts
              .sublist(1)
              .map((e) => e.isNotEmpty ? e[0].toUpperCase() + e.substring(1) : e)
              .join('');

  /// Join's the [parts] to create a name that follows `PascalCase` convention.
  /// This convention is mostly used for naming Classes, Methods in high level
  /// OOP languages like,
  /// Java, C#, Dart, C++ etc.
  ///
  /// Examples
  /// * [sample, name] will be converted to SampleName.
  /// * [another, sample, name] will be converted to AnotherSampleName.
  String toPascalCase() => parts
      .map((e) => e.isNotEmpty ? e[0].toUpperCase() + e.substring(1) : e)
      .join('');

  @override
  String toString() => parts.toString();
}

bool _isUpperCaseCharacter(int char) => char >= 65 && char <= 90;
bool _isSeparatorCharacter(int char) => char == 32 || char == 95 || char == 45;
