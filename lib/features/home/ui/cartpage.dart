import 'package:bloc_app/features/cart/bloc/cart_bloc_bloc.dart';

import 'package:bloc_app/features/home/ui/carttile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final CartBlocBloc cartbloc = CartBlocBloc();
  @override
  void initState() {
    cartbloc.add(Cartinitialevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Wishlisted '),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartbloc,
        listener: (context, state) {},
        listenWhen: (prvious, current) => current is cartActionstate,
        buildWhen: (previous, current) => current is! cartActionstate,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartsucessState:
              final sucescces = state as CartsucessState;
              return ListView.builder(
                  itemCount: sucescces.cartitems.length,
                  itemBuilder: (context, index) {
                    return CarttListtile(
                      product: sucescces.cartitems[index],
                      cartbloc: cartbloc,
                    );
                  });
          }
          return Container();
        },
      ),
    );
  }
}
