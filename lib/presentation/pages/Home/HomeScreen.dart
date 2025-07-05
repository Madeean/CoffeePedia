import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/presentation/pages/Home/bloc/home_bloc.dart';
import 'package:technical_test/presentation/themes/Colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bloc = context.read<HomeBloc>();

          return Scaffold(
            backgroundColor: CustomColors.lightGrey,
            appBar: AppBar(
              backgroundColor: CustomColors.blue,
              title: Text(
                bloc.getAppBarTitle(state.selectedIndex),
                style: const TextStyle(color: CustomColors.white),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
            body: bloc.getScreen(state.selectedIndex),
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
                items:
                    bloc.items.map<BottomNavigationBarItem>((item) {
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
                onTap:
                    (value) => {
                      context.read<HomeBloc>().add(
                        HomeItemTapped(value),
                      ),
                    },
              ),
            ),
          );
        },
      ),
    );
  }
}
