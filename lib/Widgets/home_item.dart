import 'package:flutter/material.dart';
class HomeItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;
  const HomeItem({
    required this.title,
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(iconData,color: Colors.white,size: 80,),
            Text(title,style: const TextStyle(fontSize: 30,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}