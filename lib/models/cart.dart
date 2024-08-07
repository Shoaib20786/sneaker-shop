import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoe> shoeShop =[
     const Shoe(
      name: "RTFKT Dunk",
      price: "222",
      description: "The RTFKT-branded foam midsole comes equipped with Air Zoom cushioning for responsive comfort.",
      imagePath: "assets/images/RTFKT.jpg",
      details:"The Air Jordan 13 Retro brings back the stealthy," "shrouded design with a fresh mix of colors and textures."
      " Crafted to the '98 specs as designed by Tinker Hatfield, you're getting the panther paw outsole,"
      " the holographic eye, and everything else that made these kicks iconic in the first place."
      " MJ rode the original AJ13 all the way to his 6th ring—how are you gonna make this edition famous?" 
      "/n""Benefits""Responsive Air Zoom is encapsulated in the forefoot and heel, providing springy, low-profile cushioning."
      "Genuine and synthetic leathers and textile materials in the upper provide structure and durability."
      "\nProduct Details"
      "\nHolographic eye logo"
      "\nHerringbone traction"
      "\nFoam midsole"
      "\nNot intended for use as Personal Protective Equipment (PPE)"
      "\nShown: Dune Red/Terra Blush/White/Dune Red"
      "\nStyle: DJ5982-601",
    ),
    const Shoe(
      name: "Zoom Pogo Plus",
      price: "236",
      description: "Made from premium leather, suede and textiles, the shoe balances a fresh mix of materials and colours to celebrate diversity in the skate scene.",
      imagePath: "assets/images/zoom-pogo-plus.png", 
      details: "The Air Jordan 13 Retro brings back the stealthy," "shrouded design with a fresh mix of colors and textures."
      " Crafted to the '98 specs as designed by Tinker Hatfield, you're getting the panther paw outsole,"
      " the holographic eye, and everything else that made these kicks iconic in the first place."
      " MJ rode the original AJ13 all the way to his 6th ring—how are you gonna make this edition famous?" 
      "/n""Benefits""Responsive Air Zoom is encapsulated in the forefoot and heel, providing springy, low-profile cushioning."
      "Genuine and synthetic leathers and textile materials in the upper provide structure and durability."
      "\nProduct Details"
      "\nHolographic eye logo"
      "\nHerringbone traction"
      "\nFoam midsole"
      "\nNot intended for use as Personal Protective Equipment (PPE)"
      "\nShown: Dune Red/Terra Blush/White/Dune Red"
      "\nStyle: DJ5982-601",
    ),
    const Shoe(
      name: "Air Jordans",
      price: "220",
      description: "You'have got the hopes and the speed-lace up in shoes that enhance what you bring to the court",
      imagePath: "assets/images/air-jordan.png",
       details: "The Air Jordan 13 Retro brings back the stealthy," "shrouded design with a fresh mix of colors and textures."
      " Crafted to the '98 specs as designed by Tinker Hatfield, you're getting the panther paw outsole,"
      " the holographic eye, and everything else that made these kicks iconic in the first place."
      " MJ rode the original AJ13 all the way to his 6th ring—how are you gonna make this edition famous?" 
      "/n""Benefits""Responsive Air Zoom is encapsulated in the forefoot and heel, providing springy, low-profile cushioning."
      "Genuine and synthetic leathers and textile materials in the upper provide structure and durability."
      "\nProduct Details"
      "\nHolographic eye logo"
      "\nHerringbone traction"
      "\nFoam midsole"
      "\nNot intended for use as Personal Protective Equipment (PPE)"
      "\nShown: Dune Red/Terra Blush/White/Dune Red"
      "\nStyle: DJ5982-601",
    ),
    const Shoe(
      name: "KD Treys",
      price: "240",
      description: "A secure midfoot strap is suited for scoring binges and defensive stands ,so that you can lock in and keep winning",
      imagePath: "assets/images/kd.png", 
      details: "The Air Jordan 13 Retro brings back the stealthy," "shrouded design with a fresh mix of colors and textures."
      " Crafted to the '98 specs as designed by Tinker Hatfield, you're getting the panther paw outsole,"
      " the holographic eye, and everything else that made these kicks iconic in the first place."
      " MJ rode the original AJ13 all the way to his 6th ring—how are you gonna make this edition famous?" 
      "\nBenefits"
      "\nResponsive Air Zoom is encapsulated in the forefoot and heel, providing springy, low-profile cushioning."
      "Genuine and synthetic leathers and textile materials in the upper provide structure and durability."
      "\nProduct Details"
      "\nHolographic eye logo"
      "\nHerringbone traction"
      "\nFoam midsole"
      "\nNot intended for use as Personal Protective Equipment (PPE)"
      "\nShown: Dune Red/Terra Blush/White/Dune Red"
      "\nStyle: DJ5982-601",
    ),
    const Shoe(
      name: "LeBron AMPD",
      price: "190",
      description:"Feel fast, low to the court and assured with the LeBron NXXT Gen, specifically tailored it to meet the demands of today’s fast-paced game",
      imagePath: "assets/images/LeBron-NXXT_Gen_AMPD.png", 
      details: "The Air Jordan 13 Retro brings back the stealthy," "shrouded design with a fresh mix of colors and textures."
      " Crafted to the '98 specs as designed by Tinker Hatfield, you're getting the panther paw outsole,"
      " the holographic eye, and everything else that made these kicks iconic in the first place."
      " MJ rode the original AJ13 all the way to his 6th ring—how are you gonna make this edition famous?" 
      "/n""Benefits""Responsive Air Zoom is encapsulated in the forefoot and heel, providing springy, low-profile cushioning."
      "Genuine and synthetic leathers and textile materials in the upper provide structure and durability."
      "\nProduct Details"
      "\nHolographic eye logo"
      "\nHerringbone traction"
      "\nFoam midsole"
      "\nNot intended for use as Personal Protective Equipment (PPE)"
      "\nShown: Dune Red/Terra Blush/White/Dune Red"
      "\nStyle: DJ5982-601",
    ),
  ];

  //list of items in user cart
  List<Shoe> userCart=[];


  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }
  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemToCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

  //calculate total price 
  String calculateTotalPrice(){
    int totalPrice = 0;
    for(int i=0; i<userCart.length; i++){
      totalPrice += int.parse(userCart[i].price);

  }
  return totalPrice.toString();
  }
}