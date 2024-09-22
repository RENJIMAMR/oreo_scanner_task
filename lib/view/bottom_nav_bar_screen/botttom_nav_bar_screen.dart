import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/view/add_item_screen/add_item_screen.dart';
import 'package:oreo_scanner_task/view/home_screen/home_screen.dart';
import 'package:oreo_scanner_task/view/settings_screen/settings_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: [
        HomeScreen(tabController: _tabController),
        AddItemScreen(),
        SettingsScreen()
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 11),
                  blurRadius: 24,
                  color: Colors.black.withOpacity(.14)),
              BoxShadow(
                  offset: Offset(17, 41),
                  blurRadius: 44,
                  color: Colors.black.withOpacity(.12)),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: ColorConstants.greyShade1,
            labelColor: ColorConstants.primaryBlue,
            labelStyle:
                GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400),
            dividerColor: Colors.transparent,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.qr_code_scanner_outlined), text: "Add Item"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
