import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/dummydb.dart';
import 'package:oreo_scanner_task/view/filtering_screen/widget/quantity_row_card.dart';

class RawMaterialTab extends StatelessWidget {
  const RawMaterialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search_rounded,
                color: ColorConstants.greyMain.withOpacity(.5),
              ),
              hintText: 'Search',
              hintStyle:
                  TextStyle(color: ColorConstants.greyMain, fontSize: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: ColorConstants.greyMain.withOpacity(.1),
                      width: 1))),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => QuantityRowCard(
              imageUrl: ImageConstants.MILKPOWDER,
              name: 'Milk Powder',
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: 2,
          ),
        ),
      ],
    );
  }
}
