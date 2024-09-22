import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/controller/home_screen_controller.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/filtering_screen/filtering_screen.dart';
import 'package:oreo_scanner_task/view/history_screen/history_screen.dart';
import 'package:oreo_scanner_task/view/home_screen/widget/recent_itemJ_card.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final TabController tabController;
  HomeScreen({super.key, required this.tabController});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcodeResult = "";

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        barcodeResult = result.rawContent;
      });

      if (barcodeResult.isNotEmpty) {
        // Navigate to the second tab after scanning
        context.read<AddItemScreenController>().addScannedItemToBag(
            id: barcodeResult.toString(),
            context: context); // to add scanned  item to bag
        widget.tabController.animateTo(
            1); //  to animate to tab  add item tab using tab controller after successful scanning
      }
    } catch (e) {
      log("Error scanning barcode: $e");
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        context.read<HomeScreenController>().getBagItems();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Consumer<HomeScreenController>(
          builder: (context, screenProvider, child) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // seciton:1 Logo
                    Image.asset(
                        height: 50,
                        width: 125.5,
                        fit: BoxFit.contain,
                        ImageConstants.logo),
                    // seciton:2 Welcome section

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello 👋🏻",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700, fontSize: 25),
                            ),
                            Text(
                              "Christine Doe",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageConstants.profilePic2))),
                        )
                      ],
                    ),
                    // seciton:3 insights

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              scanBarcode();
                            },
                            child: Card(
                              color: Color(0xffF8F8FB),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 44),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 17,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xffF8D4F4),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Icon(
                                              Icons.qr_code_scanner_outlined)),
                                      SizedBox(height: 14),
                                      Text(
                                        "Scan New",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 14),
                                      Text(
                                        "Scanned 0",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: ColorConstants.greyShade2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FilteringScreen(),
                                  ));
                            },
                            child: Card(
                              color: Color(0xffF8F8FB),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 44),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 17,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xff5CE1CD),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child:
                                              Icon(Icons.visibility_outlined)),
                                      SizedBox(height: 14),
                                      Text(
                                        "View all",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 14),
                                      Text(
                                        "Checkouts ${screenProvider.bagList.length}",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: ColorConstants.greyShade2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                    // seciton:4 Recent items
                    ,
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent",
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          child: Text(
                            "more",
                            style: GoogleFonts.inter(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryScreen(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              screenProvider.bagList.isNotEmpty
                  ? ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      shrinkWrap: true,
                      itemCount: screenProvider.bagList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => RecentItemCard(
                        bagDetails: screenProvider.bagList[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConstants.addItem,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'You don’t have any documents',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sync docs accross smartphones, tablets, and computers',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        )),
      ),
    );
  }
}
