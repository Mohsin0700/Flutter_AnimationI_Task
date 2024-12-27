import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/core/provider/provider_setup.dart';
import 'package:task2/ui/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyProviders.allProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
