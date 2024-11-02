import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Override this provider for each environment.
final configProvider = Provider<Config>((_) => throw UnimplementedError());

enum Environment {
  local,
  development;

  static Environment fromCurrentEnvironment(String value) {
    return Environment.values.firstWhere((e) => e.name == value);
  }
}

abstract class Config {
  String get serverHost;

  static Config fromEnvironment(Environment environment) {
    return switch (environment) {
      Environment.local => LocalConfig(),
      Environment.development => DevelopmentConfig(),
    };
  }
}

class LocalConfig extends Config {
  @override
  String get serverHost => kIsWeb
      ? 'http://localhost:8080/'
      : Platform.isAndroid
          ? 'http://10.0.2.2:8080/'
          : 'http://localhost:8080/';
}

class DevelopmentConfig extends Config {
  @override
  String get serverHost => 'https://v160-251-212-48.aadv.static.cnode.jp/';
}
