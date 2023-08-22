import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(appLocalizations.title, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(appLocalizations.description,
                  style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const Spacer(),
              FilledButton(onPressed: () {
                Navigator.of(context).pushNamed('/signin');
              }, child: Text(appLocalizations.start_confirm))
            ],
          ),
        ),
      ),
    );
  }
}
