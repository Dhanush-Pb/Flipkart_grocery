import 'package:bloc_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_app/features/home/ui/ProductTileWidget.dart';
import 'package:bloc_app/features/home/ui/cartpage.dart';
import 'package:bloc_app/features/home/ui/wishlis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final HomeBlocBloc homeBlocBloc = HomeBlocBloc();

  @override
  void initState() {
    homeBlocBloc.add(HomeinitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBlocBloc,
      listenWhen: (previous, current) => current is HomeActionstate,
      buildWhen: (previous, current) => current is! HomeActionstate,
      listener: (context, state) {
        if (state is NavigatoWishlistpage) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const cart()));
        } else if (state is NavigateCartpage) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlistpage()));
        } else if (state is HomeporductWishActionstate) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Color.fromARGB(255, 255, 145, 20),
              duration: Duration(milliseconds: 800),
              content: Text('Item carted')));
        } else if (state is HomeporductlisActionstate) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: Duration(milliseconds: 800),
              content: Text('Item wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoading:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeSucessState:
            final succecstae = state as HomeSucessState;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 255, 200, 33),
                title: const Text(
                  'Flipkart Grocery',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBlocBloc.add(HometWishtButtenNavigte());
                    },
                    icon: const Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(HomecarttButtenNavigte());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                  itemCount: succecstae.products.length,
                  itemBuilder: (context, index) {
                    return ProductListtile(
                        product: succecstae.products[index],
                        homeBlocBloc: homeBlocBloc);
                  }),
            );

          case HomeErrorStae:
            return const Scaffold(
              body: Center(
                child: Text('error'),
              ),
            );
        }
        return const SizedBox();
      },
    );
  }
}
