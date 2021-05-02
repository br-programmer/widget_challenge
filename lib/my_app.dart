import 'package:flutter/material.dart';
import 'package:widget_challenge/core/theme/app_theme.dart';
import 'package:widget_challenge/features/home/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Challenge',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
