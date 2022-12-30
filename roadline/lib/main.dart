import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roadline/routes/router.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/utils/status_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _sub = FirebaseAuth.instance.authStateChanges().listen((user) {
      _navigatorKey.currentState?.pushNamed(
        user == null ? kLoginRoute : kHomeRoute,
      );
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            scaffoldMessengerKey: StatusBar.messengerKey,
            routes: router,
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? kLoginRoute
                : kHomeRoute,
            theme: ThemeData(
              fontFamily: 'Roboto',
            ),
          );
        }
        //return const ErrorScreen();
        return Container(
          color: Colors.amber,
        );
      },
    );
  }
}
