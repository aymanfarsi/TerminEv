import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;
  const CustomTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 500.0,
      color: const Color(0xff292d32),
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      child: Container(
        color: const Color(0xff292d32),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xff292d32),
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff11151a),
                Color(0xff41454a),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff41454a),
                offset: Offset(14.9, 14.9),
                blurRadius: 30,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xff11151a),
                offset: Offset(-14.9, -14.9),
                blurRadius: 30,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
