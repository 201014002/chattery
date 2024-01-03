import 'package:flutter/material.dart';

//Services
import 'package:chattery/services/navigation_service.dart';

//Pages
import 'package:chattery/pages/splash_page.dart';
import 'package:chattery/pages/login_page.dart';

void main() {
  runApp(MainApp()
    // SplashPage(
    //   key: UniqueKey(),
    //   onInitializationComplete: () {
    //      runApp(
    //        MainApp(),
    //      );
    //   },
    // ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chattery',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
        ),
        colorScheme: ColorScheme.dark(),
      ),
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext _context) => LoginPage(),
      },
    );
  }
}
