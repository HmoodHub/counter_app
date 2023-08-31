import 'package:flutter/material.dart';

ScaffoldFeatureController appSnackBar(
  BuildContext context, {
  required Widget content,
  int duration = 1,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      duration: Duration(seconds: duration),
    ),
  );
}
