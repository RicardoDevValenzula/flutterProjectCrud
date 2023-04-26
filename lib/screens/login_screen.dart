// El comentario de abajo es para ignorar una sugerencia del inter de Dart
// ignore_for_file: prefer_const_constructors
import 'package:crud_app/ui/inputDecorations.dart';
import 'package:crud_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text('LOGIN', style: Theme.of(context).textTheme.headline4,),
                    SizedBox(height: 10),
                    _LoginForm()

                  ],
                ),
              ),
              SizedBox(height: 50),
              Text( 'Register', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white) ),
            ],
          ),
        )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecorations(hintText: 'john.doe@gmail.com', labelText: 'Email Address', prefixIcon: Icons.alternate_email_sharp),
            ),
            SizedBox(height: 40),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecorations(hintText: '*******', 
              labelText: 'Password', 
              prefixIcon: Icons.lock),
            ),
            SizedBox(height: 40),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text('Ingresar',
                style: TextStyle(color: Colors.white),),
              ),
              onPressed: (){
                //TODO: SUBMIT
              },
            )
          ]
        ),
      ),
    );
  }
}