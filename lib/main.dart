import 'package:api_call/Screens/home.dart';
import 'package:api_call/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetApiProvider()),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
