import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.onButtonTapped,
      this.width,
      this.textSize,
      this.height});
  final String buttonText;
  final void Function()? onButtonTapped;
  final double? width;
  final double? textSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTapped,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
        child: Container(
          alignment: Alignment.center,
          width: width ?? double.infinity,
          height: height ?? 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorConstants.primaryBlue,
              image: DecorationImage(
                  opacity: .5,
                  fit: BoxFit.cover,
                  image: AssetImage(ImageConstants.loginBg))),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: textSize ?? 22,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
