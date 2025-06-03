import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/presentation/pages/Home/HomeController.dart';
import 'package:technical_test/presentation/themes/Colors.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        title: Text(
          controller.appBarTitle,
          style: const TextStyle(color: CustomColors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      body: controller.currentScreen,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: CustomColors.blue,
          unselectedItemColor: CustomColors.black,
          showUnselectedLabels: false,
          items: controller.items.map<BottomNavigationBarItem>((item) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(item.icon),
              ),
              label: item.label,
            );
          }).toList(),
          currentIndex: state.selectedIndex,
          selectedItemColor: CustomColors.white,
          onTap: controller.onItemTapped,
        ),
      ),
    );
  }
}
