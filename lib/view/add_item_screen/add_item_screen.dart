import 'dart:developer';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        var screenProvider = context.read<AddItemScreenController>();
        // to show if there is no items in the current bag , else will show the bag
        if (screenProvider.scannedItems.isEmpty) {
          await scanBarcode();
        }
      },
    );
    super.initState();
  }

  String barcodeResult = "";
  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        barcodeResult = result.rawContent;
      });

      if (barcodeResult.isNotEmpty) {
        log(barcodeResult.toString());
        context
            .read<AddItemScreenController>()
            .addScannedItemToBag(barcodeResult.toString());
      }
    } catch (e) {
      log("Error scanning barcode: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 30),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // seciton:1 Logo
                  Image.asset(
                      height: 50,
                      width: 125.5,
                      fit: BoxFit.contain,
                      ImageConstants.OREOLOGO),
                  SizedBox(height: 16),
                  // seciton:2 items section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Items",
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          scanBarcode();
                        },
                        child: Text("Add more",
                            style: GoogleFonts.inter(
                                fontSize: 10,
                                color: ColorConstants.primaryBlue,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                  child: Consumer<AddItemScreenController>(
                builder: (context, screenProvider, child) => ListView.separated(
                  itemCount: screenProvider.scannedItems.length,
                  itemBuilder: (context, index) => Container(
                      child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          screenProvider.scannedItems[index].imagePath,
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                              "${screenProvider.scannedItems[index].quantity}"),
                          Text("${screenProvider.scannedItems[index].name}"),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          children: [Icon(Icons.remove)],
                        ),
                      )
                    ],
                  )),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
