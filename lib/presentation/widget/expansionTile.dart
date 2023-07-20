import 'package:flutter/material.dart';
import 'package:magdsoft_task/constant/color.dart';
//this widget for item in helpScreen
expansionTile({required String title, required String subTitle}) {

  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15),
    child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [BoxShadow(color: elevationColor, blurRadius: 8)],
            borderRadius: BorderRadius.circular(10)),
        child: ExpansionTile(
          textColor: faceColor,
          iconColor: textColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Text(
            title,

            style: const TextStyle(
                color: faceColor, fontWeight: FontWeight.w400, fontSize: 17),
          ),
          backgroundColor: Colors.white,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Align(alignment: Alignment.topLeft,
                child: Text(subTitle,

                    style: const TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
              ),
            )
          ],
        )),
  );
}
