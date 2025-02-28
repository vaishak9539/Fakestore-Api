// ignore_for_file: depend_on_referenced_packages

import 'package:fakestoreapi/provider_service/cart_provider.dart';
import 'package:fakestoreapi/provider_service/theme_provider.dart';
import 'package:fakestoreapi/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.loadThemeMode();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeProvider),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FakeStore API',
          theme: themeProvider.themeData, // Access theme data from provider
          home: const Splash(),
        );
      },
    );
  }
}
