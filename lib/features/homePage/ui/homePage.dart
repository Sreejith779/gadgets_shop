
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      listenWhen: (previous,current)=>(current is HomeActionState),
      buildWhen: (previous,current)=>(current is !HomeActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text("Discover"),
                actions: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined),
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
                      child: const TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              suffixIcon: Icon(
                                Icons.search_outlined,
                                size: 28,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    ),
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(18)),
                        margin: const EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "Clearance",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.adamina().fontFamily,
                                    color: Colors.white,
                                    fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0, left: 20),
                              child: Text(
                                "Sale",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.adamina().fontFamily,
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
                                    borderRadius: BorderRadius.circular(18)),
                                child: const Center(
                                    child: Text(
                                      " % Up to50%",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w600),
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
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "See all",
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: loadedState.model.length,
                          itemBuilder: (context,index){
                          return  Container(
                            height: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                               border: Border.all()

                              ),
                              child: Text(loadedState.model[index].category));
                          }),
                    )
                  ],
                ),
              ),
            );

          default:
            return Center(child: Text("Error"),);
        }

      },
    );
  }
}
