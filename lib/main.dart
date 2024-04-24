import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sukify/controller/provider/auth_provider/auth_provider.dart';
import 'package:sukify/view/login_screen/signInLogic.dart';
import 'package:sukify/view/onboardingScreen/onboard_screen.dart';
import 'package:sukify/view/user_screen/navbar_main.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authprovider>(create: (_) => Authprovider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sukify',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SignInLogic(),
      ),
    );
  }
}
