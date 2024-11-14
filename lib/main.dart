import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fakestoreapi/cart_provider.dart';
import 'package:fakestoreapi/home_screen.dart';
import 'package:fakestoreapi/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize ThemeProvider and load theme mode before running the app
  final themeProvider = ThemeProvider();
  await themeProvider.loadThemeMode();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeProvider),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child:  const MyApp(),
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
          title: 'Flutter Demo',
          theme: themeProvider.themeData, // Access theme data from provider
          home: const HomeScreen(),
        );
      },
    );
  }
}
