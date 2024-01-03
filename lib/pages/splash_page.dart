import 'package:flutter/material.dart';

//Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

//Services
import 'package:chattery/services/navigation_service.dart';
import 'package:chattery/services/media_service.dart';
import 'package:chattery/services/cloud_storage_service.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  SplashPage({required Key key, required this.onInitializationComplete})
      : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _setup().then(
      (_) => widget.onInitializationComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chattery',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          colorScheme: ColorScheme.dark()),
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/chattery.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );
    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );
    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );
  }
}