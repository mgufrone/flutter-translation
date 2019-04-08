import 'dart:async';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class Translate {
  static Translate instance = Translate._internal();
  Translate._internal();

  YamlMap currentLanguage;
  setLanguage(String language) async {
    String yamlContent = await rootBundle.loadString("locales/$language.yaml");
    currentLanguage = loadYaml(yamlContent);
  }

  String translate(String key) {
    if (currentLanguage == null || !currentLanguage.keys.contains(key)) {
      return key;
    }
    return currentLanguage[key];
  }
}

String translate(String key) {
  return Translate.instance.translate(key);
}
