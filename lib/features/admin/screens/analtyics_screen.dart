import 'package:amazon_clone_app/features/admin/services/admin_services.dart';
import 'package:amazon_clone_app/features/admin/widgets/category_products_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../../../commom/widgets/loader.dart';
import '../models/sales.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null ? const Loader() : Column(
      children: [
        Text(
                'RS.$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        SizedBox(
          height: 250,
          child: CategoryProductsChart(seriesList: [
            charts.Series(
              id: 'Sales', 
              data: earnings!, 
              domainFn: (Sales sales, _) => sales.label, 
              measureFn: (Sales sales, _) => sales.earning,
            ),
          ]),
        )
      ],
    );
    
  }
}
