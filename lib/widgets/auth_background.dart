import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget{

  final Widget child;

  const AuthBackground({super.key, required this.child});

@override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Loginbox(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Container(
      width: double.infinity,
      margin: EdgeInsets.only( top: 50 ),
      child: Image.asset('assets/images/logo.png',
          width: 100,
          height: 100,),
    ) );
  }
}

class _Loginbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: _loginBoxDecoration(),
    );
  }

  BoxDecoration _loginBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(88, 159, 245, 1),
        Color.fromRGBO(34, 26, 86, 1)
      ]
    )
  );
}