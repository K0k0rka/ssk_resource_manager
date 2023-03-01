import 'package:flutter/material.dart';
import 'package:ssk_resource_manager/src/pages/home/home.dart';
import 'package:ssk_resource_manager/src/pages/search_page/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ssk_resource_manager',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
