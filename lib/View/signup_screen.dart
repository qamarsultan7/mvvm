import 'package:flutter/material.dart';
import 'package:mvvm/Resources/components.dart/round_button.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/View%20Model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    double height = MediaQuery.sizeOf(context).height * 1;
    FocusNode emailfocus = FocusNode();
    FocusNode passwordfocus = FocusNode();
    ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);
    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('MVVM clean Architecture Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              focusNode: emailfocus,
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email), hintText: 'Email'),
              onFieldSubmitted: (value) {
                Utils.changefocus(context, emailfocus, passwordfocus);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
                valueListenable: _toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordfocus,
                    controller: password,
                    obscuringCharacter: '*',
                    obscureText: _toggle.value,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              _toggle.value = !_toggle.value;
                            },
                            child: Icon(_toggle.value
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password'),
                  );
                }),
            SizedBox(
              height: height * .07,
            ),
            RoundButton(
              title: 'Sign Up',
              onopress: () {
                if (email.text.isEmpty) {
                  Utils.showflushbar('Please Enter Email', context, Colors.red);
                } else if (password.text.isEmpty) {
                  Utils.showflushbar(
                      'Please Enter Password', context, Colors.red);
                } else if (password.text.length < 6) {
                  Utils.showflushbar(
                      'Please Enter 6 Digit Password', context, Colors.red);
                } else {
                  Map data = {'email': email.text, 'password': password.text};
                  authviewmodel.signInApi(data, context);
                }
              },
              loading: authviewmodel.signuploading,
            )
          ]),
        ));
  }
}
