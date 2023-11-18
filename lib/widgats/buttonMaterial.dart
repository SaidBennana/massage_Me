import 'package:flutter/material.dart';

class buttonMaterial extends StatelessWidget {
  const buttonMaterial({
    super.key,
    required this.ColorBtn,
    required this.name,
    required this.press,
  });
  final Color ColorBtn;
  final String name;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(60),
        child: MaterialButton(
          onPressed: () => press,
          minWidth: 200,
          height: 50,
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
          color: ColorBtn,
          hoverColor: Colors.white,
        ),
      ),
    );
  }
}
