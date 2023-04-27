// ignore_for_file: prefer_const_constructors

import 'package:crud_app/ui/inputDecorations.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/widgets/widgets.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                GameImage(),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )),
                Positioned(
                    top: 60,
                    right: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ))
              ],
            ),
            _GameForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _GameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecorations.authInputDecorations(
                    hintText: 'Game Name', labelText: 'Name: '),
              ),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecorations(
                    hintText: 'Hours Played', labelText: 'Hours: '),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}
