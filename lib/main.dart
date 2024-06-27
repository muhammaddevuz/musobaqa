import 'package:flutter/material.dart';
import 'package:musobaqa/controllers/cart_controller.dart';
import 'package:musobaqa/controllers/product_controller.dart';
import 'package:musobaqa/views/screens/firspage.dart';
import 'package:musobaqa/views/screens/product_details_screen.dart';
import 'package:musobaqa/views/screens/third_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return ProductController();
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Firspage(),
        );
      },
    );
  }
}
