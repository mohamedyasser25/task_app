import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/constant/color.dart';
import 'package:magdsoft_task/data/models/productsResponse.dart';
// this the item for listview in home
class ListItem extends StatelessWidget {
  final Products product;
   const ListItem( { required this.product,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          boxShadow: const [
            BoxShadow(color: elevationColor, blurRadius: 8,)],
          borderRadius: BorderRadius.circular(20)),
      height: 200.h,
      child:Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                    height: 105.h,width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: elevationColor, blurRadius: 4,)],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        product.image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
      Padding(
              padding:  EdgeInsets.only(left: 10.w,top: 10.h,bottom: 5.h),
              child:  Text(
               product.company!,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: choiceColor),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child:  Text(
                product.name!,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
            ),  Padding(
              padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 15.h),
              child: Text(
                            product.price!,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: textColor),
                          ),
            ),


          ],
        ),
        Positioned(top: 0,right:20.w,child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,size: 40.h,))),
        Positioned(bottom: 0,right: 0,
          child: Container(
                    height: 40.h,
                    width: 40.w,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            opictyColor.withOpacity(1),
                            opictyColor.withOpacity(0)
                          ]),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),),
        )


      ],)

    );
  }
}
