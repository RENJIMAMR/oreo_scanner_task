import 'dart:math';

import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/global_widgets/custom_button.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/add_item_screen/add_item_screen.dart';
import 'package:oreo_scanner_task/view/bottom_nav_bar_screen/botttom_nav_bar_screen.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.verified,
              height: 200,
              width: 200,
            ),
            Text(
              "Item added succesfully",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 16),
            CustomButton(
              height: 50,
              textSize: 16,
              width: 200,
              buttonText: "Back to Home",
              onButtonTapped: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
            TextButton(
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddItemScreen(),
                    ));
              },
              child: Text("Add more",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: ColorConstants.primaryBlue,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
