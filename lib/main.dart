import 'package:flutter/material.dart';

import 'Screens/log.dart';
List<dynamic> test =[];
Future main()async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: Log(),);
  }
}

