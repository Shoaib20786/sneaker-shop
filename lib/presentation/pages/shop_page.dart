import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sneaker_shop/models/cart.dart";
import "package:sneaker_shop/models/shoe.dart";
import "package:sneaker_shop/presentation/components/shoe_tile.dart";
import "package:sneaker_shop/presentation/pages/shoe_details_page.dart";

class ShopPage extends StatefulWidget{
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart methoid
  void addShoeToCart(Shoe shoe){  
    
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);
    //alert the user ,shoe successfully added 
    showDialog(
      context: context, 
      builder: (context) =>  AlertDialog( 
        backgroundColor: Colors.grey[900],
        title:const Text("Sucessfully Added", style: TextStyle(color: Colors.white)),
        content:const Text("Check your cart", style: TextStyle(color: Colors.white)),
      ),
    );  
  }
  
  // Navigate to shoe details page
  void navigateToShoeDetails( int index){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
      ShoeDetailsPage(
      shoe: Provider.of<Cart>(context, listen: false).getShoeList()[index],
     )));

  }

  @override
  Widget build(BuildContext context) {
   return Consumer<Cart>(builder: (context,value,child) => Column(
      children: [
        //search bar
        Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              Text("Search",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
              Icon(Icons.search,color: Colors.grey,)
            ],
          ),
        ),

        //hot picks 
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text("everyone flies.. some fly longer than others",
          style: TextStyle(color: Colors.grey[600]),),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Hot Picks 🔥 ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              Text('See all',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
            ],
          ),
        ),

        const SizedBox(height: 10,),

        //list of shoes for sale 
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
            //create a shoe 
            Shoe shoe = value.getShoeList()[index];
            //return the shoe
            return  ShoeTile(
              shoe: shoe,
              onTap: () => addShoeToCart(shoe),
              onTapDetails: () => navigateToShoeDetails(index),
              );
           }
          ),
        ),

        //divider
        const Padding(
          padding: EdgeInsets.only(top: 25.0,left: 25,right: 25),
          child: Divider(color: Colors.white,),
        ),
      ],
    ),
  );

   
  }
}