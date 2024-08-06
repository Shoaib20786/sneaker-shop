import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget{
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    showDialog(
      context: context,
       builder: (context){
        return AlertDialog(
          title:const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: (){ 
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              }, 
              child: const Text("Yes",style: TextStyle(fontSize: 20),)
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: const Text("No",style: TextStyle(fontSize: 20),)
            )
          ],
        );
      }
    ); 
  }

  @override
  Widget build(BuildContext context) {
   return Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/Nike-Logo.png",color:Colors.white, height: 30,),
                        const SizedBox(width: 10,),
                        const Text("Logged In As:",style:TextStyle(color: Colors.white),),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: user.photoURL != null ? 
                            Image.network(user.photoURL!,fit: BoxFit.fill,) :
                            const Icon(Icons.account_circle_outlined, size: 55,color: Colors.white,),
                          ),
                          const SizedBox(width: 4,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( user.displayName ?? 'User name' , style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.bold )),
                              Text(user.email!, style: const TextStyle(color: Colors.white,fontSize: 12) ,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),
              const ListTile(
               leading: Icon(Icons.home,color: Colors.white,),
               title: Text("Home",style: TextStyle(color: Colors.white),),
              ),
              const ListTile(
               leading: Icon(Icons.info,color: Colors.white,),
               title: Text("About",style: TextStyle(color: Colors.white),),
              ),
            ]),
            ListTile(
              leading: const Icon(Icons.logout,color: Colors.white,),
              title: const Text("Logout",style: TextStyle(color: Colors.white),),
              onTap:signUserOut,
            ),
            
          ],
        ),

      );
  }
}