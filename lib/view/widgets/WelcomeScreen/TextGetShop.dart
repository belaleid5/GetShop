import 'package:flutter/material.dart';

class TextGetShop extends StatelessWidget {
  const TextGetShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 230,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text.rich(
        textAlign:TextAlign.center,
        TextSpan(
          children:[
            TextSpan(
              text: 'Get  ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0xffDB7E7E),

              ),
            ),

            TextSpan(
              text: 'Shop',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
