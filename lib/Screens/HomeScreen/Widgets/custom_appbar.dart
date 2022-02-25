import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const Text("YourLibaas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          IconButton(onPressed: () {}, icon: const Icon(Icons.login))
        ],
      ),
    );
  }
}
