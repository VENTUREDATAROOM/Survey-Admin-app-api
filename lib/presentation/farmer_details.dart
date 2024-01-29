import 'package:admin_sabji/res/color/app_color.dart';
import 'package:admin_sabji/view_models/controller/kishan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/custom_text.dart';
import '../view_models/controller/dashboard_controller.dart';

class FarmerDetails extends StatefulWidget {
  final String userCode;
  const FarmerDetails({super.key, required this.userCode});

  @override
  State<FarmerDetails> createState() => _FarmerDetailsState();
}

class _FarmerDetailsState extends State<FarmerDetails> {
  final KishaanController farmercontrol = Get.put(KishaanController());
  final dashboardViewModelController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    // Fetch data on page initialization
    dashboardViewModelController.getFarmerDetailsCount(widget.userCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Farmer Details",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.first_color),
        ),
      ),
      body: Obx(
        () => farmercontrol.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 50),
                      child: Row(
                        children: [
                          CustomText("Farmers count".tr, 20, FontWeight.bold),
                          const Spacer(),
                          CustomText(
                              dashboardViewModelController.farmerCount.value
                                  .toString(),
                              28,
                              FontWeight.bold),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: farmercontrol.farmers.length,
                      itemBuilder: (context, index) {
                        final farmer = farmercontrol.farmers.value[index];
                        return (farmer['userCode'].toString() ==
                                widget.userCode)
                            ? Padding(
                                padding: const EdgeInsets.all(24),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  color: Colors.white,
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          farmer['farmerName'].toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.first_color,
                                          ),
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow("ID:",
                                            farmer['farmerId'].toString()),
                                        _buildInfoRow("User Code:",
                                            farmer['userCode'].toString()),
                                        _buildInfoRow("Phone:",
                                            farmer['phoneNumber'].toString()),
                                        _buildInfoRow(
                                          "Alternate:",
                                          farmer['alternateNumber'].toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          children: [
                                            Text(
                                              "Area & Distance",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.first_color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow(
                                            "Area:", farmer['area'].toString()),
                                        _buildInfoRow(
                                          "Distance from Mandi(in KM):",
                                          farmer['distanceFromMandi']
                                              .toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          children: [
                                            Text(
                                              "Vegetables",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.first_color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow(
                                          "Current Carrying:",
                                          farmer['vegCurntCarrying'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Quantity:",
                                          farmer['vegetableQuantity']
                                              .toString(),
                                        ),
                                        _buildInfoRow(
                                          "Variety:",
                                          farmer['varietyOfVegetables']
                                              .toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          children: [
                                            Text(
                                              "Mandi Details",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.first_color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow("Selling Area:",
                                            farmer['sellingArea'].toString()),
                                        _buildInfoRow("Name of Mandi:",
                                            farmer['nameOfMandi'].toString()),
                                        _buildInfoRow(
                                          "Commission:",
                                          farmer['amountOfCommision']
                                              .toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          children: [
                                            Text(
                                              "Other Details",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.first_color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow("Transport:",
                                            farmer['transportName'].toString()),
                                        _buildInfoRow(
                                          "Visiting Count:",
                                          "${farmer['farmerVisitingCount'].toString()}/${farmer['quest1'].toString()}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
