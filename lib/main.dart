import 'package:flutter/material.dart';
import 'package:on_graph_test_demo/presentation/router/auth_guard.dart';

import 'data/helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HelperLatLong().handleLocationPermission();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
}
