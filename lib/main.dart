import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/controller/provider.dart';
import 'package:flutter_application_quiz_app/view/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => IndexNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
