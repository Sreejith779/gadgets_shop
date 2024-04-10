import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gadgets_shoop/features/productPage/ui/ProductPage.dart';
import 'package:gadgets_shoop/models/favoriteList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../bloc/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteBloc favoriteBloc = FavoriteBloc();

  @override
  void initState() {
    favoriteBloc.add(FavoriteLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      bloc: favoriteBloc,
      listenWhen: (previous, current) => (current is FavoriteActionState),
      buildWhen: (previous, current) => (current is! FavoriteActionState),
      listener: (context, state) {},
      builder: (context, state) {
        bool isEmpty = favoriteList.isEmpty;
        switch (state.runtimeType) {
          case FavoriteLoadedState:
            final loadedState = state as FavoriteLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Favorite",
                  style: TextStyle(
                      fontFamily: GoogleFonts.cambo().fontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                backgroundColor: Colors.deepPurple.withOpacity(0.8),
              ),
              body:
           isEmpty?  Center(
             child: Lottie.network("https://lottie.host/f12ac001-5a3c-44dc-a614-521f3f9f2981/KHpjRC5Jdj.json",
             height: 280),
           ):
           
           Container(
                margin: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: loadedState.favoriteList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        product:
                                            loadedState.favoriteList[index])));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                    loadedState.favoriteList[index].image),
                                Center(
                                    child: Text(
                                        loadedState.favoriteList[index].name)),
                                IconButton(
                                    onPressed: () {
favoriteBloc.add(ProductDeleteEvent(deleteProduct: loadedState.favoriteList[index]));
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            );

          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
