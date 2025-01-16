import 'package:flutter/material.dart';
import 'package:widget_testing2/home_screen.dart';
import 'package:widget_testing2/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        futureUsers: UserRepository().fetchUsers(),
      ),
    );
  }
}
