import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:teste_magnum/core/translate/domain/entities/language_entity.dart';
import 'package:teste_magnum/core/translate/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements ILanguageRepository {
  final List<String> _supported = ['en', 'pt'];

  @override
  List<String> getSupportedLanguages() => _supported;

  @override
  Future<Language> getDefaultLanguage() async {
    final systemCode = PlatformDispatcher.instance.locale.languageCode;
    final fallback = _supported.contains(systemCode) ? systemCode : 'en';
    return Language(fallback);
  }

  @override
  Future<Map<String, String>> loadTranslations(String code) async {
    final data = await rootBundle.loadString('assets/$code.json');
    final jsonResult = json.decode(data) as Map<String, dynamic>;
    return jsonResult.map((key, value) => MapEntry(key, value.toString()));
  }
}