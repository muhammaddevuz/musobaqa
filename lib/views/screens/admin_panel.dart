import 'package:flutter/material.dart';
import 'package:musobaqa/controllers/product_controller.dart';
import 'package:musobaqa/models/product.dart';
import 'package:musobaqa/views/widgets/admin_item.dart';
import 'package:musobaqa/views/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin Panel",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: productController.list.length,
          itemBuilder: (context, index) {
            Product product = productController.list[index];
            return AdminItem(product: product);
          },
        ));
  }
}
