import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/login_screen/login_screen.dart';
import 'package:oreo_scanner_task/view/settings_screen/widget/profile_row_card.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              ImageConstants.logo,
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Profile',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.blackMain),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 80,
              decoration: BoxDecoration(
                  color: ColorConstants.blueMain,
                  borderRadius: BorderRadius.circular(17.8)),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(ImageConstants.profilePic),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arun ',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorConstants.whiteMain,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '@Arun ',
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorConstants.whiteMain,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileRowcard(
              bgImage: ImageConstants.person,
              purpose: 'My Account',
              title: 'Make changes to your account',
              isSwitch: false,
            ),
            ProfileRowcard(
              bgImage: ImageConstants.person,
              title: 'Saved Beneficiary',
              purpose: 'Manage your saved account',
              isSwitch: false,
            ),
            ProfileRowcard(
              bgImage: ImageConstants.lock,
              title: 'Face ID / Touch ID',
              purpose: 'Manage your device security',
              isSwitch: true,
            ),
            ProfileRowcard(
              bgImage: ImageConstants.protection,
              title: 'Two-Factor Authentication',
              purpose: 'Further secure your account for safety',
              isSwitch: false,
            ),
            InkWell(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                setState(() {});
              },
              child: ProfileRowcard(
                bgImage: ImageConstants.logout,
                title: 'Log out',
                purpose: 'Further secure your account for safety',
                isSwitch: false,
              ),
            ),
            Text(
              'More ',
              style: TextStyle(
                  fontSize: 16,
                  color: ColorConstants.blackMain,
                  fontWeight: FontWeight.bold),
            ),
            ProfileRowcard(
                bgImage: ImageConstants.bell, title: 'Help & Support'),
            ProfileRowcard(bgImage: ImageConstants.fav, title: 'About App')
          ]),
        ),
      ),
    );
  }
}
