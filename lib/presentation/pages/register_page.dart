import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/presentation/components/my_button.dart';
import 'package:sneaker_shop/presentation/components/my_text_field.dart';
import 'package:sneaker_shop/presentation/components/square_tile.dart';
import 'package:sneaker_shop/services/auth_services.dart';

class RegisterPage extends StatefulWidget{
  final Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //signUpUser method
  void signUserUp() async {
    //show loading indicator
    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );

    //try creating the user 
    try{
      if(passwordController.text == confirmPasswordController.text){
         await FirebaseAuth.instance.createUserWithEmailAndPassword (
         email: usernameController.text,
         password: passwordController.text
        );
      }
      else{
        showErrorMessage("Paswords do not match!");
      }
     //pop out the loading circle
     // ignore: use_build_context_synchronously
     Navigator.pop(context);

    } 
    on FirebaseAuthException catch(e){
      //pop out the loading circle
      // ignore: use_build_context_synchronously
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
            const SizedBox(height: 20,),
            const Center(child: Icon(Icons.lock,size: 100,)),
            const SizedBox(height: 10,),
            Text("Let's  create a account for you  ", style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
            const SizedBox(height: 10,),
            // username TextField
            MyTextField(
              controller: usernameController,
              hintText: "Email  ", 
              obscureText: false),
        
            //password text field
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true
            ),

            //confirm password
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: false
            ),
         
            const SizedBox(height: 20,),
        
            //sign in button
            MyButton(
              text: "Sign Up",
             onTap: signUserUp,
            ),
            const SizedBox(height:20),
            
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
           const SizedBox(height: 15,),

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

           //not a member? register now
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account ",style: TextStyle(color: Colors.grey[700]),),
              const SizedBox(width:4),
              GestureDetector(
                onTap:widget.onTap,
                child:const  Text("Login Now",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
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