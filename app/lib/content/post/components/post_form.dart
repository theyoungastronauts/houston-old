import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/utils/screen.dart';
import 'package:houston_app/core/utils/toast.dart';
import 'package:houston_app/content/post/providers/post_form_provider.dart';
import 'package:houston_app/media/asset/components/replace_image.dart';

class PostForm extends BaseComponent {
  const PostForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final post = ref.watch(postFormProvider);

    return Form(
      key: provider.formKey,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
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
                        constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height * 0.3,
                            maxHeight: MediaQuery.of(context).size.width <= ScreenUtils.breakpointSm
                                ? MediaQuery.of(context).size.height * 0.45
                                : MediaQuery.of(context).size.height * 0.55),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            for (int i = 0; i <= post.assets.length; i++)
                              SizedBox(
                                child: ReplaceImage(
                                  initialUrl: i == post.assets.length ? null : post.assets[i],
                                  title: i == post.assets.length ? 'Add a new image' : 'Image #${i + 1}',
                                  onChange: (change) {
                                    if (change!.isEmpty) {
                                      provider.removeImage(i);
                                      return;
                                    }
                                    provider.changeImage(change, index: i < post.assets.length ? i : -1);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width <= ScreenUtils.breakpointSm
                    ? MediaQuery.of(context).size.height * 0.65
                    : MediaQuery.of(context).size.height * 0.785,
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 30, maxHeight: 100),
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        label: "Discard",
                        type: AppButtonType.Text,
                        onPressed: () {
                          provider.clear();
                          AutoRouter.of(context).pop();
                        },
                      ),
                      AppButton(
                        label: post.exists ? "Save" : "Publish",
                        onPressed: () async {
                          final success = await provider.submit();

                          if (success == null) {
                            return;
                          }

                          if (success) {
                            AutoRouter.of(context).pop();
                            Toast.message("Published!");
                          } else {
                            Toast.error();
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
