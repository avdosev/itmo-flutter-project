import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotAuthed extends StatelessWidget {
  const NotAuthed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Вы не\nавторизованы\n:(',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.push('/auth/login'),
              child: Text('Войти'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(150, 30)),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => context.push('/auth/register'),
              child: Text('Регистрация'),
              style: OutlinedButton.styleFrom(fixedSize: const Size(150, 30)),
            ),
          ],
        ),
      ),
    );
  }
}
