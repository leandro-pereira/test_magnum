

import 'package:teste_magnum/core/translate/domain/entities/language_entity.dart';
import 'package:teste_magnum/core/translate/domain/repositories/language_repository.dart';

class GetDefaultLanguageUseCase {
  final ILanguageRepository repository;
  GetDefaultLanguageUseCase(this.repository);

  Future<Language> call() => repository.getDefaultLanguage();
}