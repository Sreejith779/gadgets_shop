import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gadgets_shoop/models/cartList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc cartBloc = CartBloc();
  double totalSum = 0;
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => (current is CartActionState),
      buildWhen: (previous, current) => (current is! CartActionState),
      listener: (context, state) {
        if (state is IncrementActionState) {
          setState(() {
            if (count >= 1) {
              count++;
            }
          }
          );
        }
        else if(state is DecrementActionStates){
          setState(() {
            count--;
          });
        }
      },
      builder: (context, state) {
        bool isEmpty = cartItems.isEmpty;


        switch (state.runtimeType) {
          case CartLoadedState:
            final loadedState = state as CartLoadedState;

            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.cambo().fontFamily,
                        color: Colors.white),
                  ),
                  backgroundColor: Colors.deepPurple.withOpacity(0.8),
                ),
                body: isEmpty
                    ? Center(
                        child: Lottie.network(
                            "https://lottie.host/d71ff32e-b253-417a-a492-16d4b474b4ee/J0MipZ6P8a.json",
                            height: 280),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              child: ListView.builder(
                                itemCount: loadedState.cartList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  double  amount = loadedState.cartList[index].price * count;
                                   totalSum = amount;

                                  return Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                child: Image.network(loadedState
                                                    .cartList[index].image)),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              top: 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              loadedState
                                                                  .cartList[
                                                                      index]
                                                                  .name,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 40,
                                                              right: 5),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            cartBloc.add(ItemRemoveEvent(
                                                                removeItem:
                                                                    loadedState
                                                                            .cartList[
                                                                        index]));
                                                          },
                                                          icon: Image.asset(
                                                            "assets/cross.png",
                                                            width: 30,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, right: 120),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Rs ${loadedState.cartList[index].price.toString()}",
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20),
                                                      child: Container(
                                                        height: 40,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 2.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Center(
                                                          child: IconButton(
                                                            onPressed: () {
                                                              cartBloc.add(DecrementEvent(
                                                                  item: loadedState
                                                                          .cartList[
                                                                      index],
                                                                  count:
                                                                      count));
                                                            },
                                                            icon: const Icon(
                                                                Icons.remove),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      child: Text(
                                                        count.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Container(
                                                        height: 40,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 2.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Center(
                                                          child: IconButton(
                                                            onPressed: () {
                                                              cartBloc.add(
                                                                  IncrementEvent(
                                                                      count: loadedState
                                                                          .count));
                                                            },
                                                            icon: const Icon(
                                                                Icons.add),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider()
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                   Expanded(
                                    child: Text(
                                    "Total Amount ${totalSum}rs",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                                                    ),
                                  ),
                                Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "Buy",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ));

          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
