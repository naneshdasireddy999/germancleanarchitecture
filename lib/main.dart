import 'package:dfg/3_application/core/services/theme_service.dart';
import 'package:dfg/3_application/pages/advice/advice_page.dart';
import 'package:dfg/routes/app_routes.dart';

import 'package:dfg/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeService(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (BuildContext context, themeService, child) {
        return MaterialApp(
            themeMode:
                themeService.isdarkmode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: Approutes.myroutes(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme);
      },
    );
  }
}
