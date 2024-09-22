import 'dart:developer';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/global_widgets/custom_button.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/summary_screen/summary_screen.dart';
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
        context.read<AddItemScreenController>().addScannedItemToBag(
            id: barcodeResult.toString(), context: context);
      }
    } catch (e) {
      log("Error scanning barcode: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            ),
            Expanded(
                child: Consumer<AddItemScreenController>(
              builder: (context, screenProvider, child) => ListView.separated(
                padding: EdgeInsets.all(20),
                itemCount: screenProvider.scannedItems.length,
                itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: ColorConstants.greyShade4,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 6),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(.25))
                        ]),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            screenProvider.scannedItems[index].imagePath!,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${screenProvider.scannedItems[index].quantity}",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.greyShade3,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "${screenProvider.scannedItems[index].name}",
                                maxLines: 2,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // to decrement the number of items  based on index
                                    context
                                        .read<AddItemScreenController>()
                                        .decrementQuantity(index);
                                  },
                                  icon: Icon(Icons.remove)),
                              Text(
                                  "${screenProvider.scannedItems[index].number}"),
                              IconButton(
                                  onPressed: () {
                                    // to decrement the number of items  based on index

                                    context
                                        .read<AddItemScreenController>()
                                        .incrementQuantity(index);
                                  },
                                  icon: Icon(Icons.add)),
                            ],
                          ),
                        )
                      ],
                    )),
                separatorBuilder: (context, index) => SizedBox(height: 16),
              ),
            )),

            //  show button only if there is an item in the bag
            context.watch<AddItemScreenController>().scannedItems.isNotEmpty
                ? CustomButton(
                    buttonText: "Proceed",
                    onButtonTapped: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SummaryScreen(
                              bag: context
                                  .watch<AddItemScreenController>()
                                  .scannedItems,
                            ),
                          ));
                    },
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
