// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/presentation/components/my_button.dart';
import 'package:sneaker_shop/presentation/components/my_text_field.dart';
import 'package:sneaker_shop/presentation/components/square_tile.dart';
import 'package:sneaker_shop/presentation/pages/forgot_password_page.dart';
import 'package:sneaker_shop/services/auth_services.dart';

class LoginPage extends StatefulWidget{
  final Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //signInuser method
  void signUserIn() async {
    //show loading indicator
    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );
    //try sign in
    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text
    );
    //pop out the loading circle
    Navigator.pop(context);

    } on FirebaseAuthException catch(e){
      //pop out the loading circle
      Navigator.pop(context);

      if(e.code =="user-not-found"){
        showErrorMessage(e.code);
      }
      if(e.code == 'wrong-password'){
        showErrorMessage(e.code);
      }
    }
  }

  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text(message,style: const TextStyle(color: Colors.white)),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            const Center(child: Icon(Icons.lock,size: 100,)),
            const SizedBox(height: 30,),
            Text("Welcome back you've been missed ", style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
            const SizedBox(height: 20,),
            // username TextField
            MyTextField(
              controller: usernameController,
              hintText: "Email", 
              obscureText: false),
        
            //password text field
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true
            ),
         
        
            //forget password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap:() {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgotPasswordPage())); 
                },
              child: Text("Forgot Password?",style:TextStyle(color:Colors.grey[600])))),
            ),
            const SizedBox(height: 25,),
        
            //sign in button
            MyButton(
              text: "sign In",
             onTap: signUserIn,
             
            ),
            const SizedBox(height:25),
            
            //or contiue with
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Row(
              children: [
                Expanded(child: Divider(thickness: 0.5,color: Colors.grey[400], )),
                Text("Or continue with",style: TextStyle(color: Colors.grey[700]),),
                Expanded(child: Divider(thickness: 0.5,color: Colors.grey[400], )),
              ],
             ),
           ),
           const SizedBox(height: 20,),

           //google + apple sign button
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: "assets/images/google.png",
              onTap: () {
                AuthService().signInwithGoogle();
              },
              ),
              const SizedBox(width: 10,),
              SquareTile(imagePath: "assets/images/apple.png",color: Colors.black,
              onTap: (){

              },
              ),
            ],
           ),
           const SizedBox(height: 40,),

           //not a member register now

           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?",style: TextStyle(color: Colors.grey[700]),),
              const SizedBox(width:4),
              GestureDetector(
                onTap:widget.onTap,
                child:const  Text("Register Now",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
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