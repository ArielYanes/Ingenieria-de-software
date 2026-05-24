import 'package:flutter/material.dart';
import 'vistas/pantalla_login.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Innovasoft',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const PantallaLogin(),
    );
  }
}

