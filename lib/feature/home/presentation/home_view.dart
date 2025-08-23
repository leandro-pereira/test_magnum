import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/core/translate/aplication/language_bloc.dart';
import 'package:teste_magnum/feature/home/presentation/bloc/bloc_home.dart';
import 'package:teste_magnum/feature/home/presentation/bloc/state_home.dart';
import 'package:teste_magnum/feature/post/presentation/create_post.dart';
import 'package:teste_magnum/feature/post/presentation/list_post.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final pages = [
    ListPostPage(),
    CreatePostPage(),
    const Center(child: Text("Configurações da Conta")),
  ];
  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<HomeBloc>();
    final language = context.watch<LanguageBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text("Teste Magnum")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text(language.translate('welcome'),
                  style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if (state is HomePageChanged) {
            return pages[state.index];
          }
          return pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is HomePageChanged) currentIndex = state.index;

          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Posts'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Criar'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
            ],
            currentIndex: currentIndex,
            onTap: _bloc.changePage,
          );
        },
      ),
    );
  }
}
