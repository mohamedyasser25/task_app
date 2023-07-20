import 'package:flutter/material.dart';
// this is the Card image that display image product in Product details
class ProductImage extends StatelessWidget {
  final String productImage;
  final double height;
  final double padding;
  const ProductImage(
      {required this.productImage,
      Key? key,
      required this.height, required this. padding,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 10, color: Color(0x33000000))
              ],
        borderRadius: BorderRadius.circular(20),color: Colors.white,

      ),

      child: Padding(
        padding:  EdgeInsets.all(padding),
        child: Image.network(
          productImage,
          fit: BoxFit.contain,
        ),
      ),

    );
  }
}
