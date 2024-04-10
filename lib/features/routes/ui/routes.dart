import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgets_shoop/features/favoritePage/ui/favoritePage.dart';
import 'package:gadgets_shoop/features/homePage/ui/homePage.dart';
import 'package:gadgets_shoop/features/profile/ui/profilePage.dart';


import '../../cartPage/ui/cartPage.dart';


class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {

  var isSelect = 0;
  final tabs = [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
bottomNavigationBar: NavigationBar(
indicatorColor: Colors.grey.withOpacity(0.2),
  height: 55,
  backgroundColor: Colors.white60,
  elevation: 0,
  selectedIndex: isSelect,
   onDestinationSelected: (index){
    setState(() {
      isSelect = index;
    });
   },
   destinations:  [
  NavigationDestination(icon:Image.asset("assets/home1.png",
  width: 20,height: 25,), label: "Home"),
  NavigationDestination(icon:Image.asset("assets/heart.png",
    width: 20,height: 25,), label: "Favorite"),
     NavigationDestination(icon:Image.asset("assets/cart.png",
       width: 20,height: 25,), label: "Cart"),
  NavigationDestination(icon:Image.asset("assets/user.png",
    width: 20,height: 25,) , label: "Profile")
],
),
body: tabs[isSelect],
    );
  }
}
