import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/productsBloc/products_bloc.dart';
import 'package:magdsoft_task/constant/color.dart';
import 'package:magdsoft_task/data/models/productsResponse.dart';
import 'package:magdsoft_task/presentation/view/listItem.dart';

class Home extends StatelessWidget {
  final Size size;
  List<Products> productsList = [];
  final List<Products> productsList1 = [];
  final List<Products> productsList2 = [];
  Home({Key? key, required this.size}) : super(key: key);
  final buttonName = [
    'All',
    'Acer',
    'Razer',
  ];
  final buttonImage = [
    'assets/all.png',
    'assets/acer.png',
    'assets/razer.png',
  ];
  final int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context).add(GetProducts());
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: size.width / 1.5,
                      height: 50.h,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: elevationColor2, blurRadius: 8)
                      ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon: const Icon(
                              Icons.search,
                              color: searchIcon,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: elevationColor2, blurRadius: 8)
                        ]),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/filter.png')),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Stack(children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/mainImage.png',
                        fit: BoxFit.fill,
                        height: 176.h,
                      )),
                  Positioned(
                      bottom: 10.h,
                      left: 12.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Release',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            'Acer Predator Helios 300',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ))
                ])),
            SizedBox(
              height: 15.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                    height: 70.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 8,
                              shadowColor: elevationColor,
                              // minimumSize:  Size(130.w, 40.h),
                              backgroundColor: currentIndex == index
                                  ? choiceColor
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 8, color: elevationColor)
                                    ],
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(buttonImage[index]))),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                buttonName[index],
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: buttonName.length,
                    ))),
            Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is GetProductsState) {
                    productsList = state.productsResponse.products!;
                    for (var item in productsList) {
                      item.id!.isOdd
                          ? productsList1.add(item)
                          : productsList2.add(item);
                    }
                  }
                  return Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Recomended\nfor You",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 22.sp,
                                color: textColor),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Wrap(
                            children: productsList1
                                .map((item) => Padding(
                                      padding: EdgeInsets.only(bottom: 20.h),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/product',
                                                arguments: item);
                                          },
                                          child: ListItem(product: item)),
                                    ))
                                .toList(),
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Wrap(
                          children: productsList2
                              .map((item) => Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/product',
                                              arguments: item);
                                        },
                                        child: ListItem(product: item)),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
