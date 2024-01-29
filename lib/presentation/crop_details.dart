import 'package:admin_sabji/view_models/controller/driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/color/app_color.dart';
import '../view/custom_text.dart';
import '../view_models/controller/crop_controller.dart';
import '../view_models/controller/dashboard_controller.dart';

class CropDetails extends StatefulWidget {
  final String userCode;
  const CropDetails({super.key, required this.userCode});

  @override
  State<CropDetails> createState() => _CropDetailsState();
}

class _CropDetailsState extends State<CropDetails> {
  final CropController cropControl = Get.put(CropController());
  final TextEditingController searchController = TextEditingController();
  final dashboardViewModelController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    // Fetch data on page initialization
    dashboardViewModelController.getCropDetailsCount(widget.userCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Crop Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Obx(() => cropControl.isLoading.value
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
                          CustomText("Vegetable count".tr, 20, FontWeight.bold),
                          const Spacer(),
                          CustomText(
                              dashboardViewModelController.cropCount.value
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
                        itemCount: cropControl.crops.length,
                        itemBuilder: (context, index) {
                          final crop = cropControl.crops.value[index];
                          return (crop['userCode'].toString() ==
                                  widget.userCode)
                              ? Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [AppColor.white, Colors.white],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      color: Colors.white,
                                      elevation: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Crop Info Section

                                              const Text(
                                                "Crop Info",
                                                style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildInfoRowWithIcon(
                                                Icons.person,
                                                "ID:",
                                                crop['vegId'].toString(),
                                                color: Colors.green,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.person,
                                                "Veg Name:",
                                                crop['vegetableName']
                                                    .toString(),
                                                color: Colors.green,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.phone,
                                                "Time Period:",
                                                crop['timeperiod'].toString(),
                                                color: Colors.green,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.phone,
                                                "Validity:",
                                                crop['vegetableValidity']
                                                    .toString(),
                                                color: Colors.green,
                                              ),
                                              const SizedBox(height: 16),
                                              // Vehicle Info Section
                                              const Text(
                                                "Storage Info",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildInfoRowWithIcon(
                                                Icons.directions_car,
                                                "Required:",
                                                crop['coldStorageRequirement']
                                                    .toString(),
                                                color: Colors.green,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.person,
                                                "Place:",
                                                crop['kahaSetAtiHai']
                                                    .toString(),
                                                color: Colors.green,
                                              ),
                                              const SizedBox(height: 16),
                                              // Work Info Section
                                              const Text(
                                                "Availability",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildInfoRow(
                                                "Availability:",
                                                crop['availability'].toString(),
                                                color: Colors.green,
                                              ),
                                              const SizedBox(height: 24),
                                              _buildInfoRow(
                                                "User Code:",
                                                crop['userCode'].toString(),
                                                color: Colors.green,
                                              ),
                                              // Edit Button
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                              //   children: [
                                              //     ElevatedButton.icon(
                                              //       style: ElevatedButton.styleFrom(
                                              //         foregroundColor: Colors.white,
                                              //         backgroundColor:
                                              //             Colors.green,
                                              //       ),
                                              //       onPressed:
                                              //           () {}, // Implement edit functionality
                                              //       icon: const Icon(Icons.edit, size: 20),
                                              //       label: const Text("Edit Driver"),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        }),
                  ),
                ],
              )));
  }

  Widget _buildInfoRowWithIcon(IconData icon, String label, String value,
      {Color? color}) {
    return Row(
      children: [
        Icon(icon, color: color ?? Colors.grey[800], size: 20),
        const SizedBox(width: 10),
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
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? color}) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color ?? Colors.grey[800],
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            style: TextStyle(fontSize: 18, color: color ?? Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
