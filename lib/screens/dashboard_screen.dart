import 'package:flutter/material.dart';
import 'package:magix/providers/user_view_model.dart';
import 'package:magix/widgets/dashboard_page.dart';
import 'package:magix/widgets/dashboard_request_page.dart';
import 'package:magix/widgets/dashboard_tools_page.dart';
import 'package:provider/provider.dart';

class DashboardScreenWithTabController extends StatelessWidget {
  const DashboardScreenWithTabController({Key? key}) : super(key: key);
  final List<Widget> _pages = const [
    DashboardToolsPage(),
    DashboardPage(),
    DashboardRequestPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
      builder: (context, child) => Consumer<UserViewModel>(
        builder: (ctx, model, _) {
          return Scaffold(
            body: _pages[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (index) => model.updateDashboardCurrentIndex(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Tools",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_page),
                  label: "Requests",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
