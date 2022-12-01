import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_markdown_editor/widgets/markdown_form_field.dart';
import 'package:simple_markdown_editor/widgets/markdown_toolbar.dart';

import '../../../core/components/base_component.dart';
import '../../../media/asset/components/multi_asset_manager.dart';
import '../providers/post_form_provider.dart';
import 'markdown_toolbar_icon.dart';

class PostForm extends BaseComponent {
  const PostForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final post = ref.watch(postFormProvider);
    FocusNode _focusNode = FocusNode();

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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Body',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 100,
                      width: 1500,
                      child: MarkdownFormField(
                        focusNode: _focusNode,
                        controller: provider.bodyController,
                        emojiConvert: true,
                      ),
                    ),
                    Row(
                      children: [
                        MarkDownToolbarIcon(
                          controller: provider.bodyController,
                          icon: FontAwesomeIcons.bold,
                          left: '**',
                          right: '**',
                        ),
                        MarkDownToolbarIcon(
                          controller: provider.bodyController,
                          icon: FontAwesomeIcons.italic,
                          left: '*',
                          right: '*',
                        ),
                        MarkDownToolbarIcon(
                          controller: provider.bodyController,
                          icon: FontAwesomeIcons.heading,
                          left: '# ',
                          right: '',
                        ),
                        MarkDownToolbarIcon(
                          controller: provider.bodyController,
                          icon: FontAwesomeIcons.code,
                          left: '`',
                          right: '`',
                        ),
                        MarkDownToolbarIcon(
                          controller: provider.bodyController,
                          icon: FontAwesomeIcons.strikethrough,
                          left: '~~',
                          right: '~~',
                        ),
                      ],
                    )
                  ],
                ),
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
