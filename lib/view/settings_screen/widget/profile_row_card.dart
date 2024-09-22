import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';

class ProfileRowcard extends StatefulWidget {
  const ProfileRowcard(
      {super.key,
      this.isSwitch = false,
      required this.bgImage,
      required this.title,
      this.purpose = ''});
  final bool isSwitch;

  final String bgImage, title, purpose;

  @override
  State<ProfileRowcard> createState() => _ProfileRowcardState();
}

class _ProfileRowcardState extends State<ProfileRowcard> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorConstants.containergrey,
            backgroundImage: AssetImage(widget.bgImage),
            radius: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.purpose,
                style: TextStyle(fontSize: 12, color: ColorConstants.greyMain),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 5,
          ),
          widget.isSwitch
              ? Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                )
              : Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorConstants.greyMain,
                  size: 15,
                )
        ],
      ),
    );
  }
}
