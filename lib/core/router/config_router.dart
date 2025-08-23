import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class AppRoute {
  const AppRoute();

  String get path;
  String get name;

  void go(BuildContext context, {Map<String, String> params = const {}, Map<String, String> queryParams = const {}}) {
    context.goNamed(name, pathParameters: params, queryParameters: queryParams);
  }

  void push(BuildContext context, {Map<String, String> params = const {}, Map<String, String> queryParams = const {}}) {
    context.pushNamed(name, pathParameters: params, queryParameters: queryParams);
  }

  // routes
  static const home = _Home();
  static const post = _Post();
}

class _Home extends AppRoute {
  const _Home();

  @override
  String get path => '/';

  @override
  String get name => 'home';
}

class _Post extends AppRoute {
  const _Post();

  @override
  String get path => '/';

  @override
  String get name => 'post';
}
