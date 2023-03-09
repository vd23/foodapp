import 'package:amazon_clone_app/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone_app/features/account/widgets/orders.dart';
import 'package:amazon_clone_app/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children :[
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/24-hours.png', width: 120,height: 50,),
            
            ),
           // Text('Food Restro'),
            Container(
              padding:  const EdgeInsets.only(left: 4,right: 15),
              child: Row(children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.notifications_active_outlined,color: Colors.black),
                  ),
                  Icon(Icons.search,color: Colors.black,),
              ]),
            ),
           ],
          ),
        ),
      ),
      body: Column(
        children: const[
        BelowAppBar(),
        SizedBox(height: 10),
        TopButtons(),
        SizedBox(height: 20),
        Orders(),
      ],
     ),

    );
  }
}