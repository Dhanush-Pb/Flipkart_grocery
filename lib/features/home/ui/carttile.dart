import 'package:bloc_app/data/cartitems.dart';
import 'package:bloc_app/features/cart/bloc/cart_bloc_bloc.dart';

import 'package:bloc_app/features/home/models/home_pr_model.dart';
import 'package:flutter/material.dart';

class CarttListtile extends StatelessWidget {
  final CartBlocBloc cartbloc;
  // ignore: prefer_const_constructors_in_immutables
  CarttListtile({super.key, required this.product, required this.cartbloc});
  final prodctdatamodel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(product.imageurl), fit: BoxFit.cover)),
            height: 200,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(product.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price}",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBlocBloc.add(HomeproductCarttbuttenclickevent(
                      //     clickproduct: product));
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Adjust the padding as needed
                    child: IconButton(
                      onPressed: () {
                        cartbloc.add(CartRemove(prductdatemode: product));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.blue,
                            duration: const Duration(milliseconds: 700),
                            content: Text('${product.name} Removed')));
                      },
                      icon: const Icon(Icons.delete_outline_rounded),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
