import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teste_magnum/core/router/config_router.dart';
import 'package:teste_magnum/feature/home/home_page.dart';

class AppRouter  {
  static final GoRouter router = GoRouter(
      initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text("Página não encontrada")),
    ),
  );
}
