import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ListMode {
  grid,
  list,
}

class ListModeProvider extends StateNotifier<ListMode> {
  ListModeProvider() : super(ListMode.grid);

  _update(ListMode mode) {
    state = mode;
  }

  grid() {
    _update(ListMode.grid);
  }

  list() {
    _update(ListMode.list);
  }
}

final listModeProvider = StateNotifierProvider.family<ListModeProvider, ListMode, String>(
  (ref, family) => ListModeProvider(),
);
