import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/changeIndex/change_index_bloc.dart';
import 'package:magdsoft_task/constant/color.dart';
import 'package:magdsoft_task/data/models/productsResponse.dart';
import 'package:magdsoft_task/presentation/view/productImage.dart';


class ProductScreen extends StatelessWidget {
  final Products product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var changeIndexBloc = BlocProvider.of<ChangeIndexBloc>(context);
    int currentIndex = 0;
    final productImage = [
      'assets/image3.png',
      'assets/productImage.png',
      'assets/image2.png'
    ];
    final pages = [
       Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. ',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
      Container(
        color: Colors.orange,
      ),
      Container(
        color: Colors.blue,
      )
    ];
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
              opictyColor.withOpacity(0.85),
              opictyColor.withOpacity(0)
            ])),
        child: SingleChildScrollView(
          child:            BlocBuilder<ChangeIndexBloc, ChangeIndexState>(
    builder: (context, state) {
    if(state is ChangeState){
    currentIndex=state.index;
    }
    return
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h, left: 23.w, bottom: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: elevationColor, blurRadius: 5)
                      ]),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Text(
                  product.name!,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 23.w),
                child: Text(
                  'Type:${product.type}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 33.w, left: 33.w, top: 15.h),
                  child: ProductImage(
                      productImage: product.image!,
                      height: 300.h,
                      padding: 40.0)

                  ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: SizedBox(
                  height: 100.h,
                  // color: Colors.cyanAccent,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: ProductImage(
                                productImage: product.image!,
                                height: 60.h,
                                padding: 20),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 5.w,
                          ),
                      itemCount: productImage.length),
                ),
              ),

              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 33.w),
                child: Container(
                  height: 65.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Color(0x33000000))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Card(
                        child: Image.asset('assets/acer-logo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Acer Official Store',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textColor),
                            ),
                            Text('View Store',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: searchIcon))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 18.w),
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: elevationColor, blurRadius: 4)
                              ]),
                          child: IconButton(
                              onPressed: () {},
                              icon:  Icon(
                                Icons.arrow_forward_ios,
                                color: faceColor,
                                size: 12.h,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 33.w, left: 33.w, bottom: 37.h),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: searchIcon),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text('${product.price!} EGP',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: textColor)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  opictyColor.withOpacity(1.0),
                                  opictyColor.withOpacity(0),
                                ])),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                // minimumSize: Size(0, 30.h),
                                backgroundColor: Colors.transparent,
                                elevation: 4,
                                shadowColor: Colors.transparent),
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )))
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: searchIcon,
                indent: 57,
                endIndent: 57,
              ),

              BlocBuilder<ChangeIndexBloc, ChangeIndexState>(
  builder: (context, state) {
    if(state is ChangeState){
      currentIndex=state.index;
    }
    return Row(
                children: [
                  TextButton(
                      onPressed: () {
                        changeIndexBloc.add(ChangeIndex(0));
                      },
                      child: Column(
                        children: [
                          Text(
                            "Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color:
                                    currentIndex == 0 ? textColor : searchIcon),
                          ),
                          if (currentIndex == 0)
                            Image.asset('assets/point.png')
                        ],
                      )),
                  TextButton(
                      onPressed: () { changeIndexBloc.add(ChangeIndex(1));},
                      child: Column(
                        children: [
                          Text(
                            "Spesification",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color:
                                    currentIndex == 1 ? textColor : searchIcon),
                          ),
                          if (currentIndex == 1)
                            Image.asset('assets/point.png')
                        ],
                      )),
                  TextButton(
                      onPressed: () { changeIndexBloc.add(ChangeIndex(2));},
                      child: Column(
                        children: [
                          Text(
                            "Review",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                                color:
                                    currentIndex == 2 ? textColor : searchIcon),
                          ),
                          if (currentIndex == 2)
                            Image.asset('assets/point.png')
                        ],
                      ))
                ],
              );
  },
),

              Padding(
                padding: const EdgeInsets.all(30),
                child: Container( child: pages[currentIndex]),
              ),
            ],
          );}
        ),
      )),
    ));
  }
}
