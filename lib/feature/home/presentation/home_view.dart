import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/core/translate/aplication/language_bloc.dart';
import 'package:teste_magnum/feature/home/presentation/bloc/home_bloc.dart';
import 'package:teste_magnum/feature/home/presentation/bloc/home_state.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageBloc>();
    // final _bloc = context.read<PostBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
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
      body: ListView(
        children: [
          BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              } else if (state is PostError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('No posts available'));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Criar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
        ],
        currentIndex: 0,
        onTap: (s) {},
      ),
    );
  }
}
