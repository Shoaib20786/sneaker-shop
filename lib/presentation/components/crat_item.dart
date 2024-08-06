import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget{
  Shoe shoe;
  CartItem({super.key,required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart(){
    Provider.of<Cart>(context,listen: false).removeItemToCart(widget.shoe);
    showDialog(context: context, 
    builder: (context)=> AlertDialog(
      backgroundColor: Colors.grey[900],
      title: const Text("Removed from your cart",style:TextStyle(color: Colors.white,fontSize: 20),),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text("\$${widget.shoe.price}"),
        trailing: IconButton(onPressed: removeItemFromCart, 
        icon:const  Icon(Icons.delete)),
      ),
    );
  }
}
