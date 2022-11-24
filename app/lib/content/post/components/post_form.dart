import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../providers/post_form_provider.dart';
import '../../../media/asset/components/multi_asset_manager.dart';

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
                decoration: const InputDecoration(label: Text("Title")),
                onChanged: (_) {
                  provider.updateModel();
                },
              ),
              TextFormField(
                controller: provider.bodyController,
                validator: provider.bodyValidator,
                decoration: const InputDecoration(label: Text("Body")),
                minLines: 3,
                maxLines: 3,
                onChanged: (_) {
                  provider.updateModel();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: MultiAssetManager(
                  assets: post.assets,
                  onAdd: provider.addAsset,
                  onRemove: provider.removeAsset,
                  onUpdate: provider.updateAsset,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
