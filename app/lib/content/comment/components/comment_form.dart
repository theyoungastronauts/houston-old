import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/comment_form_provider.dart';
import '../../../core/components/base_component.dart';

class CommentForm extends BaseComponent {
  final String postUuid;
  const CommentForm(this.postUuid, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(commentFormProvider(postUuid).notifier);
    final model = ref.watch(commentFormProvider(postUuid));

    return Container(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.parent != null)
              Row(
                children: [
                  Text(
                    "Replying to ${model.parent!.owner.name}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  InkWell(
                      onTap: () {
                        provider.setParent(null);
                      },
                      child: Text(" x ", style: Theme.of(context).textTheme.caption)),
                ],
              ),
            Form(
              key: provider.formKey,
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: provider.bodyController,
                    validator: provider.bodyValidator,
                    focusNode: provider.focusNode,
                    decoration: const InputDecoration(label: Text("New Comment...")),
                    onFieldSubmitted: (_) {
                      if (provider.bodyController.text.isEmpty) {
                        return;
                      }

                      provider.submit();
                    },
                    onChanged: (val) {
                      provider.updateModel();
                    },
                  ),
                ),
                IconButton(onPressed: provider.bodyController.text.isEmpty ? null : provider.submit, icon: const Icon(Icons.send))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
