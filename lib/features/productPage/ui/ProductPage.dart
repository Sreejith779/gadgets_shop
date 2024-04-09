import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gadgets_shoop/models/gadgetModel.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});
  final GadgetModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.product.name,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.cabin().fontFamily),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new),),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.5),
            child: IconButton(onPressed: () {  },
              icon: const Icon(Icons.favorite_outline),),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.5),
              child: IconButton(onPressed: () {  },
                icon: const Icon(Icons.share),),
            ),
          ),
        ],

      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.network(widget.product.image),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(18)),
                            child: Center(
                                child: Text(
                              widget.product.sale,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white,
                                      spreadRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  widget.product.rating.toString(),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white,
                                      spreadRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.thumb_up,
                                  size: 20,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.product.likesPercentage.toString(),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${widget.product.numberOfReviews.toString()} reviews',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        widget.product.description,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(
                        decoration:  BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 2, color: Colors.grey.withOpacity(0.2)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                      child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rs ${widget.product.price.toString()}",
                        style: const TextStyle(fontSize: 25,
                        fontWeight: FontWeight.w600),),
                          Container(
                            height: 60,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(18)
                            ),
                            child: const Center(child: Text("Add to Cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}