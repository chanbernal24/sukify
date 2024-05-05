import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sukify/controller/provider/address_provider.dart';
import 'package:sukify/controller/provider/auth_provider/auth_provider.dart';
import 'package:sukify/view/address_screen/address_screen.dart';
import 'package:sukify/view/login_screen/signInLogic.dart';
import 'package:sukify/view/user_data_screen/user_data_input_screen.dart';
import 'package:sukify/view/user_screen/navbar_main.dart';

import 'firebase_options.dart';

//CODE BLOCK BELOW WAS COMMENTED OUT TO BYPASS AUTHENTICATION

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// THE CODE ABOVE WAS REPLACED BY DEFAULT VOID MAIN FOR THE APP TO RUN
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return

        // MULTIPROVIDER COMMENTED OUT.

        MultiProvider(
            providers: [
          ChangeNotifierProvider<Authprovider>(create: (_) => Authprovider()),
          ChangeNotifierProvider<AddressProvider>(
              create: (_) => AddressProvider()),
        ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sukify',
              theme: ThemeData(
                  useMaterial3: true,
                  bottomSheetTheme:
                      BottomSheetThemeData(backgroundColor: Colors.black54)),
              home: SignInLogic(),
            )

            // ), // MULTIPROVIDED ENCLOSER
            );
  }
}
