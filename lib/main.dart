import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:localhost/authentication/screens/start.dart';
import 'package:intl/locale.dart' as intl;

void main() {
  runApp(const ProviderScope(child: Main()));
}

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    Jiffy.setLocale(locales!.first.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.setLocale(intl.Locale.parse(Platform.localeName).languageCode);
    return MaterialApp(
      title: 'Localhost',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006494)),
        useMaterial3: true,
        fontFamily: 'Pretendard',
      ),
      home: const StartPage(),
    );
  }
}
