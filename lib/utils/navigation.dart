import 'package:flutter/material.dart';

extension NavigateTo on BuildContext {
  void to(Widget Function() builder) =>
      Navigator.of(this).push(MaterialPageRoute(
        builder: (context) => builder(),
      ));
}
