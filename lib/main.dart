import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teste_magnum/core/network/dio_client.dart';
import 'package:teste_magnum/core/router/app_router.dart';
import 'package:teste_magnum/core/theme/theme.dart';
import 'package:teste_magnum/core/theme/theme_bloc.dart';
import 'package:teste_magnum/core/translate/aplication/language_bloc.dart';
import 'package:teste_magnum/core/translate/aplication/language_state.dart';
import 'package:teste_magnum/core/translate/data/translation_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = LanguageRepositoryImpl();
    final bloc = LanguageBloc(repo);
    final dio =  DioClient();
    final themeCubit = ThemeCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => themeCubit),
        BlocProvider.value(
          value: bloc
            ..add(
              LoadLanguage(),
            ),
        ),
        Provider(create: (_) => dio)
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, localizationState) {
              return MaterialApp.router(
                title: 'Test magnum',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                routerConfig: AppRouter.router,
                locale: Locale(localizationState is LanguageInitial
                    ? localizationState.language.code
                    : 'en'),
              );
            },
          );
        },
      ),
    );
  }
}
