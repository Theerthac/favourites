import 'package:favourite/controller/favourite_provider.dart';
import 'package:favourite/view/favourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouriteScreen(),
      ),
    );
  }
}