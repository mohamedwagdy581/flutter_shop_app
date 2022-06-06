import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/shared/style/colors.dart';

import '../../shared/network/cubit/cubit.dart';
import '../../shared/network/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        return ListView.separated(
          itemBuilder: (context, index) => buildFavProduct(),
          separatorBuilder: (context, index) => const Divider(
            thickness: 2,
          ),
          itemCount: 15,
        );
      },
    );
  }

  Widget buildFavProduct() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/R.300756144ee94c0048440274a043e0ec?rik=f25T4LKGDOQzQQ&pid=ImgRaw&r=0'),
                    width: 100,
                    height: 100.0,
                  ),
                  if (1 != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '{model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.3,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '2000',
                          style: const TextStyle(
                            color: defaultColor,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        if (1 != 0)
                          Text(
                            '5000',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            //print(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 14.0,
                            backgroundColor:
                                true ? Colors.red : Colors.grey[300],
                            child: const Icon(
                              Icons.favorite_border,
                              size: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
