import 'package:chop_chop_flutter/Theme.dart';
import 'package:chop_chop_flutter/screens/auth_wrapper.dart';
import 'package:chop_chop_flutter/screens/providers/cart_provider.dart';
import 'package:chop_chop_flutter/screens/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (val) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().myUser,
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Chop Chop',
        theme: basicTheme(),
        home: AuthWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}