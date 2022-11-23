import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/content/post/providers/post_form_provider.dart';
import 'package:houston_app/media/asset/components/replace_image.dart';

class PostForm extends BaseComponent {
  const PostForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final post = ref.watch(postFormProvider);

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: provider.titleController,
                validator: provider.titleValidator,
                onChanged: (_) {
                  provider.updateModel();
                },
                decoration: const InputDecoration(label: Text("Title")),
              ),
              TextFormField(
                controller: provider.bodyController,
                validator: provider.bodyValidator,
                onChanged: (_) {
                  provider.updateModel();
                },
                minLines: 3,
                maxLines: 3,
                decoration: const InputDecoration(label: Text("Body")),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  constraints:
                      BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.3, maxHeight: MediaQuery.of(context).size.height * 0.8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [...post.assets, null].asMap().entries.map(
                      (entry) {
                        final i = entry.key;
                        final forAdd = entry.value == null;

                        return SizedBox(
                          key: Key("$i${entry.value}"),
                          child: ReplaceImage(
                            initialUrl: entry.value,
                            title: forAdd ? "Add Image" : 'Image #${i + 1}',
                            onRemove: () {
                              if (!forAdd) {
                                provider.removeImage(i);
                              }
                            },
                            onChange: (url) {
                              if (forAdd) {
                                provider.addImage(url);
                              } else {
                                provider.updateImage(i, url);
                              }
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
