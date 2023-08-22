import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _sentVerifyCode = false;
  late TextEditingController _phoneController;
  late TextEditingController _verifyCodeController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _verifyCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _verifyCodeController.dispose();
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
    Navigator.of(context).pushNamed('/signup');
  }

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
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
                enabled: !_sentVerifyCode,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: appLocalizations.signin_phone),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                onSubmitted: (phone) => _sendVerifyCode(phone),
              ),
              const SizedBox(height: 16),
              if (_sentVerifyCode)
                TextField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: appLocalizations.signin_verify),
                  controller: _verifyCodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
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
                      child: Text(_sentVerifyCode
                          ? appLocalizations.signin_confirm
                          : appLocalizations.signin_send_verify),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
