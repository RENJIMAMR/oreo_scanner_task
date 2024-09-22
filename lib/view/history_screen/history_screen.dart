import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/controller/home_screen_controller.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/home_screen/widget/recent_itemJ_card.dart';

import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            ImageConstants.logo,
            height: 50,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Recently added',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Consumer<HomeScreenController>(
              builder: (context, screenProvider, child) => screenProvider
                      .bagList.isNotEmpty
                  ? ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      shrinkWrap: true,
                      itemCount: screenProvider.bagList.length,
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
            ),
          )
        ],
      ),
    ));
  }
}
