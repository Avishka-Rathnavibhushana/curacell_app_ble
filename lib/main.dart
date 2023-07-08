import 'package:curacell/home_screen.dart';
import 'package:curacell/navigation_screen.dart';
import 'package:curacell/screens/connect_screen.dart';
import 'package:curacell/screens/welcome_screen.dart';
import 'package:curacell/services/bluetooth_service.dart';
import 'package:curacell/services/firebase_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BluetoothService>(
            create: (context) => BluetoothService()),
        ChangeNotifierProvider<AuthFunctions>(
            create: (context) => AuthFunctions())
      ],
      child: Builder(
        builder: (BuildContext context) {
          final auth = AuthFunctions();
          auth.getUser();
          print('now');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: (auth.firebaseUser == null)
                ? NavigationScreen()
                : ConnectScreen(),
          );
        },
      ),
    );
  }
}
