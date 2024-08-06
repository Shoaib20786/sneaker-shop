import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sneaker_shop/models/cart.dart";
import "package:sneaker_shop/models/shoe.dart";
import "package:sneaker_shop/presentation/components/crat_item.dart";

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Consumer<Cart>(
    builder: (context,value,child)=> Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  Text("My Cart",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
      
          Expanded(
            child:ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index){
                //get individual added shoe
                Shoe individualShoe = value.getUserCart()[index];
                //return th cart item
                return CartItem(shoe: individualShoe,);
              }
              
              ),
            ),
            //pay button 
            Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text("Total Price",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("\$${value.calculateTotalPrice()}",
                          style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 18)),
                        ],
                      ),
                      const Row(
                        children: [
                          Text("Pay Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white,),
                        ],
                      )
                    ],
                  )
                ),
      
      
        ],
      
      ),
    ),
    
    );
  }

  
}