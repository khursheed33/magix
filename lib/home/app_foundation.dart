import 'package:flutter/material.dart';
import 'package:magix/home/app_routers.dart';
import 'package:magix/home/route_paths.dart';
import 'package:magix/providers/user_view_model.dart';
import 'package:provider/provider.dart';

class AppFoundation extends StatelessWidget {
  const AppFoundation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePath.dashboardTabControler,
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
