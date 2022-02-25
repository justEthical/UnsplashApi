import 'package:flutter/material.dart';
import 'package:yourlibaas/Screens/HomeScreen/Widgets/custom_appbar.dart';
import 'package:yourlibaas/Screens/HomeScreen/Widgets/image_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: const[
        CustomAppbar(),
        ImageGridView(),
      ],)
      ,),
    );
  }
}