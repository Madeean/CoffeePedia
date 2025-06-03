import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/presentation/navigations/RoutePage.dart';
import 'package:technical_test/presentation/themes/Colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutePage.home.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF50CE8A), Color(0xFF5066CE)],
            begin: Alignment.topLeft,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: Center(
          child: Text(
            "CoffeePedia",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 34,
              color: CustomColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
