
import 'package:teste_magnum/core/translate/domain/entities/language_entity.dart';

abstract class ILanguageRepository {
  Future<Language> getDefaultLanguage();
  Future<Map<String, String>> loadTranslations(String code);
  List<String> getSupportedLanguages();
}