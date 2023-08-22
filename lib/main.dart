import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localhost/home/screens/home.dart';
import 'package:localhost/start/screens/signin.dart';
import 'package:localhost/start/screens/signup.dart';
import 'package:localhost/start/screens/start.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Localhost',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006494)),
          useMaterial3: true,
        ),
        initialRoute: '/start',
        routes: {
          '/start': (context) => const StartPage(),
          '/signin': (context) => const SigninPage(),
          '/signup': (context) => const SignupPage(),
          '/home': (context) => const HomePage(),
        });
  }
}
