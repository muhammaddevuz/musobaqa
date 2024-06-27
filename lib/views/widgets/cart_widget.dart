import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musobaqa/controllers/cart_controller.dart';
import 'package:musobaqa/views/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class CadrWidget extends StatefulWidget {
  const CadrWidget({super.key});

  @override
  State<CadrWidget> createState() => _CadrWidgetState();
}

class _CadrWidgetState extends State<CadrWidget> {
  @override
  Widget build(BuildContext context) {
    final cardController = context.watch<CartController>();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "My Card",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: cardController.list.length,
                  itemBuilder: (context, index) {
                    final product = cardController.list[index];
                    return Card(
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          height: 150,
                          width: 100,
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      cardController
                                          .decrementProductCount(product.id);
                                    },
                                    icon: const Icon(CupertinoIcons.minus)),
                                Text(
                                  product.count.toString(),
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                    onPressed: () {
                                      cardController
                                          .incrementProductCount(product.id);
                                    },
                                    icon: const Icon(CupertinoIcons.add)),
                                Container(
                                  height: 25,
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "\$${product.count * product.price}",
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
                    );
                  },
                ),
              ),
              SizedBox(
                height: 110,
              )
            ],
          ),
          Positioned(
              bottom: 80,
              right: 0,
              child: Row(
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "\$${cardController.totalPrice()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                height: 70,
                child: Center(
                  child: Text(
                    'Checkout Cart',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
