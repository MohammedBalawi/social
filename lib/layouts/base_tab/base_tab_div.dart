import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/controller/base_tab/tabbar_cubit.dart';
import 'package:marrige_app/layouts/base_tab/nav_bar.dart';
import 'package:marrige_app/layouts/my_account/my_account_screen.dart';

import '../home/home_view.dart';

class BaseTabDiv extends StatelessWidget {
  final List<Widget> _pages = [
     HomeView(),
    Placeholder(color: Colors.red),
    Placeholder(color: Colors.green),
    Placeholder(color: Colors.blue),
    MyAccountScreen(),
    Center(child: Icon(Icons.star, size: 50)),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabBarCubit(),  // Provide the TabCubit
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BlocBuilder<TabBarCubit, BottomNavPage>(
          builder: (context, selectedTab) {
            return NavBar(
              selectedTab: selectedTab,
              onTabSelected: (tab) {
                context.read<TabBarCubit>().selectTab(tab);
              },
            );
          },
        ),
        body: BlocBuilder<TabBarCubit, BottomNavPage>(
          builder: (context, selectedTab) {
            return IndexedStack(
              index: selectedTab.index,
              children: _pages,
            );
          },
        ),
      ),
    );
  }
}