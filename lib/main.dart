import 'package:flutter/material.dart';
import 'screens/comeback_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'package:provider/provider.dart';
import 'state/quiz_provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => QuizProvider(), child: MowloApp())
  );
}

class MowloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mowlo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFFFFC542),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => ComebackScreen(),
        '/dashboard': (_) => DashboardScreen(),
        '/quiz': (_) => QuizScreen(),
        '/result': (_) => ResultScreen(),
      },
    );
  }
}
