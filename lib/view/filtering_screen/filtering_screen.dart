import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/filtering_screen/tabs/products_tab.dart';
import 'package:oreo_scanner_task/view/filtering_screen/tabs/raw_material_tab.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listen for tab changes to update the UI
    _tabController.addListener(() {
      setState(() {}); // Trigger UI update on tab change
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              ImageConstants.logo,
              fit: BoxFit.cover,
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController, // Use the tab controller
                    labelPadding: EdgeInsets.zero,
                    indicator: BoxDecoration(
                      color: ColorConstants.whiteMain,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    unselectedLabelColor: ColorConstants.whiteMain,
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: ColorConstants.whiteMain,
                                borderRadius: BorderRadius.circular(15),
                                image: _tabController.index == 0
                                    ? DecorationImage(
                                        image:
                                            AssetImage(ImageConstants.loginBg),
                                        fit: BoxFit.cover,
                                      )
                                    : null //to Change background dynamically
                                ),
                            child: Center(
                              child: Text(
                                'Products',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 0
                                      ? ColorConstants.whiteMain
                                      : ColorConstants
                                          .blueMain, //to Change text color dynamically
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: ColorConstants.whiteMain,
                                borderRadius: BorderRadius.circular(15),
                                image: _tabController.index == 1
                                    ? DecorationImage(
                                        image:
                                            AssetImage(ImageConstants.loginBg),
                                        fit: BoxFit.cover,
                                      )
                                    : null //to Change background dynamically
                                ),
                            child: Center(
                              child: Text(
                                'Raw materials',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 1
                                      ? ColorConstants.whiteMain
                                      : ColorConstants
                                          .blueMain, //to Change text color dynamically
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20, // space between TabBar and TabBarView
                  ),
                  SizedBox(
                    height:
                        400, //  height for TabBarView to avoid using Expanded
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Productstab(),
                        RawMaterialTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
