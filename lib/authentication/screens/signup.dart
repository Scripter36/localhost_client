import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localhost/common/screens/home.dart';
import 'package:localhost/utils/route_builders.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  late TextEditingController _nickNameController;
  bool _agreePolicy = false;

  @override
  void initState() {
    _nickNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nickNameController.dispose();
    super.dispose();
  }

  void _signup() {
    // TODO: check nickname and agree policy, and signup
    Navigator.of(context).pushAndRemoveUntil(
        RouteBuilders.sharedAxisTransition(const HomePage(), SharedAxisTransitionType.horizontal), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.signup_title),
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(appLocalizations.signup_guide, style: textTheme.bodyMedium),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(appLocalizations.signup_profile, style: textTheme.labelLarge),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset('assets/images/default_image.png', width: 160, height: 160),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: appLocalizations.signup_profile_nickname,
                              helperText: appLocalizations.signup_profile_nickname_supporting,
                            ),
                            controller: _nickNameController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () => setState(() => _agreePolicy = !_agreePolicy),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                if (Platform.isIOS) const SizedBox(width: 4),
                                Checkbox.adaptive(
                                    value: _agreePolicy,
                                    onChanged: (value) {
                                      setState(() {
                                        _agreePolicy = value!;
                                      });
                                    }),
                                Expanded(
                                    child: Text(
                                  appLocalizations.signup_agree_poilcy(
                                      appLocalizations.signup_agree_policy_terms_of_service,
                                      appLocalizations.signup_agree_policy_privacy_policy),
                                  style: textTheme.bodyMedium,
                                )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: FilledButton(
                        onPressed: () => _signup(),
                        child: Text(appLocalizations.signup_confirm),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      onWillPop: () {
        Navigator.of(context).pop();
        return Future.value(false);
      },
    );
  }
}
