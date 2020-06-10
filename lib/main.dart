import 'package:ammar/pages/login_page.dart';
import 'package:ammar/state/auth_provider.dart';
import 'package:ammar/state/merchant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MerchantProvider>(
          create: (_) => MerchantProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
