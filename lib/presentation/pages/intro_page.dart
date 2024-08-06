import 'package:flutter/material.dart';
import 'package:sneaker_shop/presentation/pages/auth_page.dart';


class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset("assets/images/Nike-Logo.png",height: 240,),
              ),
              const SizedBox(height: 40,),
              const Text("Just Do it",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 24,),
              const Text("Brand new sneakers and custom kicks made with premium quality",
              style: TextStyle(fontSize: 16,color: Colors.grey),
              textAlign: TextAlign.center,),
              const SizedBox(height: 48,),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const AuthPage())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child:const Center(
                    child: Text("Shop Now",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  )
                ),
              )

          
            ],
          ),
        )
      ),
    );
  }
  
}