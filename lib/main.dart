import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/di/Injection.dart';
import 'package:technical_test/presentation/navigations/RouteGenerator.dart';
import 'package:technical_test/presentation/navigations/RoutePage.dart';
import 'package:technical_test/presentation/pages/Coffee/globalBloc/coffee_bloc.dart';
import 'package:technical_test/presentation/pages/Home/bloc/home_bloc.dart';

import 'domain/CoffeeUseCase.dart';

void main() {
  setupDI();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => CoffeeBloc(sl<CoffeeUseCase>())),
      ],
      child: MyApp(),
    ),
  );
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
