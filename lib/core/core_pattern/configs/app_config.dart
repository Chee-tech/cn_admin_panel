import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum Environment {STAGE, PROD }

class AppValues {
  final String? baseUrl;
  AppValues({@required this.baseUrl});
}

class AppConfig {
  final Environment? environment;
  final String? name;
  final Color? color;
  final AppValues? values;
  static AppConfig? _instance;

  factory AppConfig(
      {required Environment environment,
      @required name,
      Color color = Colors.blue,
      required AppValues values}) {
    _instance ??= AppConfig._internal(environment, name, color, values);
    return _instance!;
  }

  AppConfig._internal(this.environment, this.name, this.color, this.values);
  static AppConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.environment == Environment.PROD;
  static bool isStaging() => _instance!.environment == Environment.STAGE;
}
