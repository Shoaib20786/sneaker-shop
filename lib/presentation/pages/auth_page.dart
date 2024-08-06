import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/presentation/pages/home_page.dart';
import 'package:sneaker_shop/presentation/pages/login_or_register.dart';


class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: StreamBuilder<User?>(
      stream:FirebaseAuth.instance.authStateChanges() ,
      builder: (context, snapshot) {
        //if user is logged in
        if(snapshot.hasData){
          return const HomePage();
        }
        //if user is not logged in
        else{
          return const LoginOrRegisterPage();
        }
      },),
   );
  }
  
}