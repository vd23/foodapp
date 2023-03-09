import 'package:amazon_clone_app/features/account/widgets/single_product.dart';
import 'package:amazon_clone_app/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../../models/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: orders!.length,
      gridDelegate: const Sli,
      itemBuilder: (context, index) {
        final orderData = orders![index];
        return SizedBox(
          height: 140,
          child: SingleProduct(
            image: orderData.products[0].images[0],
          ),
        );
      },
    );
  }
}
