// El comentario de abajo es para ignorar una sugerencia del inter de Dart
// ignore_for_file: prefer_const_constructors
import 'package:crud_app/ui/inputDecorations.dart';
import 'package:crud_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 10),
                  ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(), child: _LoginForm())
                ],
              ),
            ),
            SizedBox(height: 50),
            Text('Register',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecorations(
              hintText: 'john.doe@gmail.com',
              labelText: 'Email Address',
              prefixIcon: Icons.alternate_email_sharp),
          onChanged: (value) => loginForm.email = value,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);

            return regExp.hasMatch(value ?? '')
                ? null
                : 'Invalid Email Address';
          },
        ),
        SizedBox(height: 40),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecorations(
              hintText: '*******',
              labelText: 'Password',
              prefixIcon: Icons.lock),
          onChanged: (value) => loginForm.password = value,
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'Password Must be at least 8 characters';
          },
        ),
        SizedBox(height: 40),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Colors.deepPurple,
          onPressed: loginForm.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  if (!loginForm.isValidForm()) return;
                  Navigator.pushReplacementNamed(context, 'home');
                },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              loginForm.isLoading ? 'Wait' : 'Log In',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
