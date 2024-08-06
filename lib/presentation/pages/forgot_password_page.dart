import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/presentation/components/my_button.dart';
import 'package:sneaker_shop/presentation/components/my_text_field.dart';
import 'package:sneaker_shop/presentation/pages/login_page.dart';

class ForgotPasswordPage extends StatefulWidget{
   const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
   String email ="";

  final forgotController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar( backgroundColor: Colors.white,
          content: Text("Password reset mail has been sent !",style: TextStyle(fontSize: 18,color: Colors.green),)
        )
      );

    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar( backgroundColor: Colors.white,
            content: Text(" No user found for this email.",style: TextStyle(fontSize: 18,color: Colors.red),) 
          )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar( title: const Text("Forgot Password",style: TextStyle(fontSize:22),),centerTitle: true,),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60,),
          const Center(child: Icon(Icons.lock_reset_rounded,size: 140,)),
          const SizedBox(height: 20,),
          const Text("Password Recovery",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          Text("Enter your Registered Email",style: TextStyle(fontSize:18,color: Colors.grey[700])),
          const SizedBox(height: 20,),
          Form(
            key: _formKey,
            child:Column(
              children: [
                MyTextField(
                  controller: forgotController,
                  hintText: "Enter Email",
                   obscureText: false
                ),
                const SizedBox(height: 20,),
                MyButton(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        email =forgotController.text;
                      });
                      resetPassword();
                    }
                  }, 
                  text: "Send Email"
                )
              ],
            ) 
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Remember your password?",style: TextStyle(color: Colors.grey[700]),),
              const SizedBox(width:4),
              GestureDetector(
                onTap:(){
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginPage()));
                },
                child:const  Text("Login",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
              ),
            ],
           ),
        ],
      ),
    ),
   );
  }
}