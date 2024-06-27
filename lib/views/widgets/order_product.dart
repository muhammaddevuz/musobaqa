import 'package:flutter/material.dart';
import 'package:musobaqa/models/cart.dart';

// ignore: must_be_immutable
class OrderProduct extends StatelessWidget {
  Cart cart;
  OrderProduct({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            width: 100,
            child: Image.network(
              cart.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "Amoun: ${cart.count}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 25,
                    width: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Total: \$${cart.count * cart.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
