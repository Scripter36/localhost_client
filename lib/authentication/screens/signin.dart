import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localhost/authentication/screens/signup.dart';
import 'package:localhost/utils/route_builders.dart';

class SigninPage extends ConsumerStatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends ConsumerState<SigninPage> {
  bool _sentVerifyCode = false;
  late TextEditingController _phoneController;
  late TextEditingController _verifyCodeController;
  late FocusNode _phoneFocusNode;
  late FocusNode _verifyCodeFocusNode;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _verifyCodeController = TextEditingController();
    _phoneFocusNode = FocusNode();
    _verifyCodeFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _verifyCodeController.dispose();
    _phoneFocusNode.dispose();
    _verifyCodeFocusNode.dispose();
    super.dispose();
  }

  void _sendVerifyCode(String phone) {
    // TODO
    setState(() {
      _sentVerifyCode = true;
    });
  }

  void _verifyCode(String verifyCode) {
    // TODO: verify code. if failed, show snackbar. else, if registered, go to home. else, go to register.
    Navigator.of(context).pushAndRemoveUntil(
        RouteBuilders.sharedAxisTransition(const SignupPage(), SharedAxisTransitionType.horizontal), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    if (_sentVerifyCode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _verifyCodeFocusNode.requestFocus();
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _phoneFocusNode.requestFocus();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.signin_title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                focusNode: _phoneFocusNode,
                autofocus: !_sentVerifyCode,
                enabled: !_sentVerifyCode,
                decoration:
                    InputDecoration(border: const OutlineInputBorder(), labelText: appLocalizations.signin_phone),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  MaskedInputFormatter('###-####-####', allowedCharMatcher: RegExp(r'[0-9]')),
                ],
                onSubmitted: (phone) => _sendVerifyCode(phone),
              ),
              const SizedBox(height: 16),
              if (_sentVerifyCode)
                TextField(
                  focusNode: _verifyCodeFocusNode,
                  autofocus: true,
                  decoration:
                      InputDecoration(border: const OutlineInputBorder(), labelText: appLocalizations.signin_verify),
                  controller: _verifyCodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onSubmitted: (verifyCode) {
                    _verifyCode(verifyCode);
                  },
                ),
              const Spacer(),
              Row(
                children: [
                  if (_sentVerifyCode) ...[
                    Expanded(
                      child: FilledButton.tonal(
                        onPressed: () {
                          setState(() {
                            _sentVerifyCode = false;
                            _verifyCodeController.clear();
                          });
                        },
                        child: Text(appLocalizations.signin_edit_phone),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (_sentVerifyCode) {
                          _verifyCode(_verifyCodeController.text);
                        } else {
                          _sendVerifyCode(_phoneController.text);
                        }
                      },
                      child:
                          Text(_sentVerifyCode ? appLocalizations.signin_confirm : appLocalizations.signin_send_verify),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
