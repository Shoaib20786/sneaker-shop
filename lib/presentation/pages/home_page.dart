import 'package:flutter/material.dart';
import 'package:sneaker_shop/presentation/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/presentation/components/my_drawer.dart';
import 'package:sneaker_shop/presentation/pages/cart_page.dart';
import 'package:sneaker_shop/presentation/pages/shop_page.dart';

class HomePage  extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0; 

  void navigateBottomBar(int index){
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> _pages =[
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index) ,
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(builder: (context)=> IconButton( 
          icon: const Icon(Icons.menu,color: Colors.black,),
           onPressed: (){
             Scaffold.of(context).openDrawer();
            }, 
          ),
        ) ,
      ),
      drawer: const MyDrawer(),
      body: _pages[selectedindex],
      
    );
  }
}
