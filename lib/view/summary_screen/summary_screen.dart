import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/global_widgets/custom_button.dart';
import 'package:oreo_scanner_task/model/product_model.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/success_screen/success_screen.dart';

import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.bag});
  final List<ProductModel> bag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // seciton:1 Logo
                    Image.asset(
                        height: 50,
                        width: 125.5,
                        fit: BoxFit.contain,
                        ImageConstants.logo),
                    SizedBox(height: 16),
                    // section:2 date time section
                    Text("Items",
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.bold)),

                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 6),
                                blurRadius: 6,
                                color: Colors.black26)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              Text(
                                "Time",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "11/09/2024",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                "3 PM",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    // section:3 Items Section
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(blurRadius: 20, color: Colors.black26)
                      ]),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Raw material name ",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Batch No",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Quantity",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bag[index].name.toString(),
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        bag[index].batchNumber.toString(),
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${bag[index].number.toString()} X  ${bag[index].quantity.toString()}",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => Divider(
                            height: 60,
                            thickness: 1.5,
                            color: Colors.black,
                          ),
                      itemCount: bag.length),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        buttonText: "Proceed",
        onButtonTapped: () {
          context.read<AddItemScreenController>().clearItemsInBag();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessScreen(),
            ),
            (route) => false,
          );
        },
      ),
    );
  }
}
