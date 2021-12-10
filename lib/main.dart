import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_cost/provider/perk_provider.dart';
import 'package:team_cost/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PerkProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Metropolis',
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
