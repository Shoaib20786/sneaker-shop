import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class ShoeDetailsPage extends StatefulWidget{
  final Shoe shoe;
  const ShoeDetailsPage({super.key, required this.shoe});

  @override
  State<ShoeDetailsPage> createState() => _ShoeDetailsPageState();
}

class _ShoeDetailsPageState extends State<ShoeDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar( 
      backgroundColor: Colors.grey[100],
      title: Text(widget.shoe.name,style:const TextStyle(fontWeight: FontWeight.w500)),
      centerTitle: true,
      ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
           child:Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListView(
              children: [
                Image.asset(widget.shoe.imagePath,height: 300, width: 300,),
                Text(widget.shoe.name,style:const TextStyle(fontSize: 24,fontWeight: FontWeight.w600)),
                Text("Price: \$ ${widget.shoe.price}",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                Text("Incl. of taxes\n(Also includes all applications duties)",style: TextStyle(fontSize: 12,color: Colors.grey[600]) ,),
                const SizedBox(height: 20,),
                Text(widget.shoe.details,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey[700])),
                const SizedBox(height:15,),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                      
                    ),
                    onPressed: (){
                     
                  
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add to the wishlist",style: TextStyle(color: Colors.white,fontSize: 18)),
                      SizedBox(width: 20,),
                      Icon(Icons.favorite_border,color: Colors.white,)
                    ],
                  )),
                ),
                const SizedBox(height: 30,),
              ],
                       ),
           )
        )

      ],
    ),
   );
  }
}