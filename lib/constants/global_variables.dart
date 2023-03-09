import 'package:flutter/material.dart';

String uri = 'http://localhost:3000';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static const secondryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Color.fromARGB(255, 255, 254, 254);
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const selectedNavBarColor = Colors.cyan;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'https://media.istockphoto.com/id/936595484/photo/tasty-mini-burgers.jpg?s=612x612&w=0&k=20&c=C3_dgQz9p9GyRAPmmIFJUNqklSUF6-3zijkof5luUPo=',
    'https://media.istockphoto.com/id/888999298/photo/ready-to-eat.jpg?s=612x612&w=0&k=20&c=UVtE1lUd7_lPHWZ_acU6vGsCQAijsufqJaL8LOUmwuo=',
    'https://images.unsplash.com/photo-1543353071-087092ec393a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZCUyMHByZXNlbnRhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1516100882582-96c3a05fe590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZCUyMHByZXNlbnRhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZvb2QlMjBwcmVzZW50YXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  ];

  static const List<Map<String, String>> categoryImages = [
    {'title': 'Burger', 'image': 'assets/images/burger.png'},
    {'title': 'juice', 'image': 'assets/images/juice.png'},
    {'title': 'diet', 'image': 'assets/images/diet.png'},
    {'title': 'noodle', 'image': 'assets/images/noodle.png'},
    {'title': 'pasta', 'image': 'assets/images/pasta.png'},
  ];
}
