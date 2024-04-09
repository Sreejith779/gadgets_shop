import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gadgets_shoop/features/productPage/ui/ProductPage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _searchQuery = '';

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => (current is HomeActionState),
      buildWhen: (previous, current) => (current is! HomeActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            final filteredList = _searchQuery.isEmpty?loadedState.model:
                loadedState.model.where((element) =>
                    element.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text("Discover"),
                actions: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      child: Stack(
                        children: [

                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_bag_outlined),
                            ),
                          ),
                          const Positioned(
                            left: 20,
                            top: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              radius: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child:  TextField(
onChanged: (value){
setState(() {
  _searchQuery = value;
});
},
                          decoration: const InputDecoration(
                              hintText: "Search",
                              suffixIcon: Icon(
                                Icons.search_outlined,
                                size: 28,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(18)),
                                margin: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      child: Text(
                                        "Clearance",
                                        style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.adamina().fontFamily,
                                            color: Colors.white,
                                            fontSize: 25),
                                      ),
                                     ),
                                     Padding(
                                      padding:
                                          const EdgeInsets.only(top: 0, left: 20),
                                      child: Text(
                                        "Sale",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                                GoogleFonts.adamina().fontFamily,
                                            fontSize: 25),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 38,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: const Center(
                                            child: Text(
                                          " % Up to50%",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 120,
                                child: Image.asset(
                                  'assets/mobile.png',
                                ),
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: loadedState.model.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.only(right: 18),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          loadedState.model[index].category,
                                          style: const TextStyle(
                                            fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ));
                                  }),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    children: List.generate(
                                        filteredList.length,
                                        (index) => InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                            ProductPage(product: filteredList[index],)));
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: double.maxFinite,
                                                      margin: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey.withOpacity(0.2),
                                                        borderRadius: BorderRadius.circular(15)
                                                      ),
                                                  child: Image.network(filteredList[index].image.toString(),
                                                  height: MediaQuery.of(context).size.height*0.3,)
                                                    ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8),
                                                    child: Text(filteredList[index].name,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500
                                                    ),),
                                                  ),
                                                  const Icon(Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 15),
                                                    child: Text(filteredList[index].rating.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 12),
                                                child: Text("Rs ${filteredList[index].price.toString()}",
                                                style:  TextStyle(
                                                  fontSize: 17,
                                            fontFamily:  GoogleFonts.cambo().fontFamily,
                                                  fontWeight: FontWeight.w600
                                                ),),
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );


          default:
            return const Center(
              child: Text("Error"),
            );
        }
      },
    );
  }
}
