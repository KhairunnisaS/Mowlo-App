import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/quiz_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const MowloApp());
}

class MowloApp extends StatelessWidget {
  const MowloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: MaterialApp(
        title: 'Mowlo Quiz App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        home: const WelcomeScreen(), // Initial screen
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/dashboard': (context) => const DashboardScreen(),
          '/quiz': (context) => const QuizScreen(),
          '/result': (context) => const ResultScreen(),
        },
      ),
    );
  }
}