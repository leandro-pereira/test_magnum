import 'package:equatable/equatable.dart';
import 'package:teste_magnum/core/translate/domain/entities/language_entity.dart';

abstract class LanguageEvent extends Equatable {
}

abstract class LanguageState extends LanguageEvent {
  @override
  List<Object?> get props => [];
}
class LoadLanguage extends LanguageState {}

class LanguageInitial extends LanguageState {
  final Language language;
  final Map<String, String> translations;
  LanguageInitial(this.language, this.translations);
}
