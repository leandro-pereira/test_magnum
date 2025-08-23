import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teste_magnum/core/router/config_router.dart';
import 'package:teste_magnum/feature/home/home_page.dart';
import 'package:teste_magnum/feature/post/presentation/create_post.dart';

class AppRouter  {
  static final GoRouter router = GoRouter(
      initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoute.post.path,
        name: AppRoute.post.name,
        builder: (context, state) => const CreatePostPage(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text("Página não encontrada")),
    ),
  );
}
