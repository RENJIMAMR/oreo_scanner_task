import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';

class QuantityRowCard extends StatelessWidget {
  const QuantityRowCard(
      {super.key, required this.imageUrl, required this.name});
  final String imageUrl, name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 80,
      decoration: BoxDecoration(
          color: ColorConstants.containergrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text(
                'Today',
                style: TextStyle(fontSize: 15, color: ColorConstants.greyMain),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.whiteMain),
            child: Center(
              child: Text(
                '1 Bags',
                style: TextStyle(fontSize: 14, color: ColorConstants.blackMain),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
