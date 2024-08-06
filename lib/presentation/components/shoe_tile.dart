import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget{
  final void Function() ? onTap;
  final void Function() ? onTapDetails;
  Shoe shoe;
  ShoeTile({super.key,required this.shoe,required this.onTap, this.onTapDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDetails,
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width:280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius:BorderRadius.circular(12), 
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SHoe pic
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(shoe.imagePath,height: 250,)
              ),
            ),
            //description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(shoe.description,style:TextStyle(color: Colors.grey[600])),
            ),
            //price+deta
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shoe.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const SizedBox(height: 5,), 
                      Text("\$${shoe.price}",style:const  TextStyle(color: Colors.grey),),
                    ],
                  ),
                  //button to add to cart
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      ),
                      child:const  Icon(Icons.add,color: Colors.white,),),
                  )
                  
                ],
              ),
            )
          ],
        )
      
      ),
    );
  }
  
}