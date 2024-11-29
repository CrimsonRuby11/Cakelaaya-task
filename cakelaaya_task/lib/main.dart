import 'package:cakelaaya_task/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 223, 57, 44), 
          brightness: Brightness.light,
          surface: Colors.white,
          primary: const Color.fromARGB(255, 223, 57, 44), 
          secondary: Colors.white,
          onSecondary: const Color.fromARGB(255, 223, 57, 44),
        ),
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        )
      ),

      home: const Dashboard(),
    );
  }
}
