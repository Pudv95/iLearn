import 'package:flutter/material.dart';
import 'package:ilearn/Features/Home/Screens/Cart/cart.dart';
import 'package:ilearn/Features/Home/Screens/Wishlist/wishlist.dart';

import '../../../../Models/student_model.dart';

class ActionBar{
  BuildContext context;
  int pageIndex;
  PageController controller;
  User user;
  ActionBar({required this.context,required this.pageIndex,required this.controller,required this.user});
  List<Widget> actionList () => [
    IconButton(
      icon: const Icon(Icons.favorite_outline,
        size: 30,),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWishlist(currPage: pageIndex, pageController: controller, user: user,)));
      },
    ),
    Padding(
        padding: const EdgeInsets.only(left: 2),
        child: IconButton(
          icon :const Icon(
            Icons.shopping_cart_outlined,size: 30,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart(currPage: pageIndex, pageController: controller, user: user,)));
          },
        )
    ),
    Padding(
        padding: const EdgeInsets.only(left: 2, right: 30),
        child: IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
          onPressed: (){},
        )
    ),
  ];
}