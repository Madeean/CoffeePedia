import 'package:flutter/material.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/presentation/pages/Coffee/detail/CoffeeDetailScreen.dart';
import 'package:technical_test/presentation/pages/Home/HomeScreen.dart';
import 'package:technical_test/presentation/pages/Splash/SplashScreen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case '/detail':
      final coffee = settings.arguments as CoffeeDomainModel?;
      if (coffee != null) {
        return MaterialPageRoute(
          builder: (_) => CoffeeDetailScreen(coffee: coffee),
        );
      }

      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(
              body: Center(child: Text('Error: No coffee data provided')),
            ),
      );
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(
              body: Center(child: Text('404: Page Not Found')),
            ),
      );
  }
}
