import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BottomSheetContainer extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final bool withDismiss;
  final Function()? handleMenuPressed;
  final Function()? onClose;
  final Widget? topRight;
  final CrossAxisAlignment columnAlignment;

  const BottomSheetContainer(
      {Key? key,
      required this.children,
      this.title,
      this.withDismiss = true,
      this.handleMenuPressed,
      this.onClose,
      this.topRight,
      this.columnAlignment = CrossAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.bottomSheetBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6.0),
          topRight: Radius.circular(6.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: columnAlignment,
            children: [
              if (title != null)
                Row(
                  children: [
                    IgnorePointer(
                      ignoring: !withDismiss,
                      child: Opacity(
                        opacity: withDismiss ? 1 : 0,
                        child: IconButton(
                          onPressed: () {
                            if (onClose != null) {
                              onClose!();
                              return;
                            }
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    if (topRight != null) topRight!,
                    if (topRight == null)
                      Opacity(
                        opacity: handleMenuPressed == null ? 0 : 1,
                        child: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: handleMenuPressed,
                        ),
                      ),
                  ],
                ),
              ...children
            ],
          ),
        ),
      ),
    );
  }
}
