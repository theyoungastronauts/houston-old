import 'package:flutter/material.dart';

import '../components/empty_placeholder.dart';

String _errorText({int? statusCode, String? message}) {
  List<String> parts = ["Error"];
  if (statusCode != null) {
    parts.insert(0, "$statusCode");
  }
  if (message != null) {
    parts.add(": $message");
  }

  return parts.join();
}

AppBar appBarError({int? statusCode, String? message}) {
  List<String> parts = ["Error"];
  if (statusCode != null) {
    parts.insert(0, "$statusCode");
  }
  if (message != null) {
    parts.add(": $message");
  }

  return AppBar(
    title: Text(_errorText(statusCode: statusCode, message: message)),
    automaticallyImplyLeading: false,
  );
}

Widget contentError({int? statusCode, String? message}) {
  return EmptyPlaceholder(title: _errorText(statusCode: statusCode, message: message));
}
