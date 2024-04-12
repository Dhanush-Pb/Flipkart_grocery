import 'package:bloc_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_app/features/home/models/home_pr_model.dart';
import 'package:flutter/material.dart';

class ProductListtile extends StatelessWidget {
  final HomeBlocBloc homeBlocBloc;
  // ignore: prefer_const_constructors_in_immutables
  ProductListtile(
      {super.key, required this.product, required this.homeBlocBloc});
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
                // ignore: prefer_const_constructors
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBlocBloc.add(HomeproductCarttbuttenclickevent(
                          clickproduct: product));
                    },
                    icon: const Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(Homeproductishlistbuttenclickevent(
                            clickproduct: product));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
