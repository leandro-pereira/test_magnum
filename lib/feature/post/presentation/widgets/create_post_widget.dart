import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/core/translate/aplication/language_bloc.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_create_bloc.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_create_state.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageBloc>();
    final _bloc = context.read<PostCreateBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(language.translate('createPost')),
      ),
      body: BlocConsumer<PostCreateBloc, PostCreateState>(
        listener: (context, state) {
          if (state is PostCreateCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(language.translate('postCreatedSuccessfully'))),
            );
            Navigator.pop(context);
          } else if (state is PostCreateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is PostCreateLoading;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _bloc.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _bloc.titleController,
                      decoration: InputDecoration(
                        labelText: language.translate('postTitle'),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? language.translate('postContent')
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _bloc.bodyController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: language.translate('postContent'),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? language.translate('postContentPlaceholder')
                          : null,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: isLoading ? null : _bloc.onSubmit,
                      icon: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Icon(Icons.save),
                      label: Text(isLoading
                          ? language.translate('saving')
                          : language.translate('save')),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
