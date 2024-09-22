import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(.25))
        ],
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Row Material",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Today",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: ColorConstants.greyShade3,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        color: Colors.black.withOpacity(.25))
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
                child: Text(
                  "Report",
                  style: GoogleFonts.rubik(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        color: Colors.black.withOpacity(.25))
                  ],
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text(
                      "6",
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 53, 39, 39),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 7),
                    Text(
                      "Bags",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 53, 39, 39),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
