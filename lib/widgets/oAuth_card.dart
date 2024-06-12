import 'package:flutter/material.dart';

class AccCard extends StatelessWidget {
  const AccCard({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final void Function() onTap;
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          color: const Color.fromARGB(45, 228, 67, 67),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
