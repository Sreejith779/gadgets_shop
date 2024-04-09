import 'package:flutter/material.dart';
import 'package:gadgets_shoop/features/favoritePage/ui/favoritePage.dart';
import 'package:gadgets_shoop/features/homePage/ui/homePage.dart';
import 'package:gadgets_shoop/features/profile/ui/profilePage.dart';
import 'package:gadgets_shoop/features/searchPage/ui/searchPage.dart';


class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {

  var isSelect = 0;
  final tabs = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
bottomNavigationBar: NavigationBar(
  height: 55,
  backgroundColor: Colors.white60,
  elevation: 0,
  selectedIndex: isSelect,
   onDestinationSelected: (index){
    setState(() {
      isSelect = index;
    });
   },
   destinations: const [
  NavigationDestination(icon:Icon(Icons.home,color: Colors.black,), label: "Home"),
  NavigationDestination(icon:Icon(Icons.search_outlined,color: Colors.black,), label: "Search"),
  NavigationDestination(icon:Icon(Icons.favorite,color: Colors.black,), label: "Favorite"),
  NavigationDestination(icon: Icon(Icons.person,color: Colors.black,), label: "Profile")
],
  
),
body: tabs[isSelect],
    );
  }
}
