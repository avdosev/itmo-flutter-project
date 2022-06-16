import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Тут пусто',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
