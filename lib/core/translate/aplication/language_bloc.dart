import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/core/translate/aplication/language_state.dart';
import 'package:teste_magnum/core/translate/domain/entities/language_entity.dart';
import 'package:teste_magnum/core/translate/domain/repositories/language_repository.dart';



class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final ILanguageRepository repository;

  Map<String, String> translations = {};

  LanguageBloc(this.repository) : super(LanguageInitial(Language('en'), {})) {
    on<LoadLanguage>((event, emit) async {
      final lang = await repository.getDefaultLanguage();
      translations = await repository.loadTranslations(lang.code);
      emit(LanguageInitial(lang, translations));
    });
  }

  String translate(String key) {
    return translations[key] ?? "";
  }

}
