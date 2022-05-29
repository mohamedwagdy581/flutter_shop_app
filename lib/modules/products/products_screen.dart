import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/shared/network/cubit/cubit.dart';
import 'package:flutter_shop_app/shared/network/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) 
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).homeModel != null, 
          builder: (context) => productsBuilder(), 
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          );
      },
    );
  }

  Widget productsBuilder() => Column();
}