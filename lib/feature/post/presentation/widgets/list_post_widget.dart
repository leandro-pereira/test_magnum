import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/core/router/config_router.dart';
import 'package:teste_magnum/core/translate/aplication/language_bloc.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_bloc.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_state.dart';

class ListPostsWidget extends StatelessWidget {
  const ListPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
 final language = context.watch<LanguageBloc>();
    final _bloc = context.read<PostBloc>();
    return RefreshIndicator(
      onRefresh: _bloc.fetchPosts,
      child: ListView(
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
                    return GestureDetector(
                      onTap: () {
                        AppRoute.post.push(
                          context,
                          params: {'id': post.id.toString()},
                        );
                      },
                      child: Card(  
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                post.body,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is PostError) {
                return Center(child: Text(state.message));
              }
              return Center(
                  child: Text(language.translate('noPostsAvailable')));
            },
          ),
        ],
      ),
    );
  }
}