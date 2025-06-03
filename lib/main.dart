import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/di/Injection.dart';
import 'package:technical_test/presentation/navigations/RouteGenerator.dart';
import 'package:technical_test/presentation/navigations/RoutePage.dart';

void main() {
  setupDI();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: [routeObserver],
      onGenerateRoute: onGenerateRoute,
      initialRoute: RoutePage.splash.path,
    );
  }
}
