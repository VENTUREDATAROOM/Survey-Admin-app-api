import 'package:admin_sabji/view_models/controller/driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/color/app_color.dart';
import '../view/custom_text.dart';
import '../view_models/controller/dashboard_controller.dart';

class DriverDetails extends StatefulWidget {
  final String userCode;
  const DriverDetails({super.key, required this.userCode});

  @override
  State<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  final DriverController drivercontrol = Get.put(DriverController());
  final dashboardViewModelController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    // Fetch data on page initialization
    dashboardViewModelController.getDriverDetailsCount(widget.userCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Driver Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrangeAccent,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Obx(() => drivercontrol.isLoading.value
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
                          CustomText("Drivers count".tr, 20, FontWeight.bold),
                          const Spacer(),
                          CustomText(
                              dashboardViewModelController.driverCount.value
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
                        itemCount: drivercontrol.drivers.length,
                        itemBuilder: (context, index) {
                          final driver = drivercontrol.drivers.value[index];
                          return (driver['userCode'].toString() ==
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
                                              // Driver Info Section
                                              const Text(
                                                "Driver Info",
                                                style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildInfoRowWithIcon(
                                                Icons.person,
                                                "ID:",
                                                driver['driverId'].toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.person,
                                                "Name:",
                                                driver['driverName'].toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.phone,
                                                "Phone:",
                                                driver['driverNumber']
                                                    .toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.phone,
                                                "Alternate:",
                                                driver['alternateNumber']
                                                    .toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              const SizedBox(height: 16),
                                              // Vehicle Info Section
                                              const Text(
                                                "Vehicle Info",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildInfoRowWithIcon(
                                                Icons.directions_car,
                                                "Vehicle No.:",
                                                driver['dvechileName']
                                                    .toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              _buildInfoRowWithIcon(
                                                Icons.person,
                                                "Owner Name:",
                                                driver['vechileOwnerName']
                                                    .toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              const SizedBox(height: 16),
                                              // Work Info Section
                                              const Text(
                                                "Work Info",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildInfoRow(
                                                "Quantity of Vegetables:",
                                                driver['quantityOfVegetables']
                                                    .toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              _buildInfoRow(
                                                "Round Count:",
                                                "${driver['roundCount'].toString()}/${driver['timesOfRaotation'].toString()}",
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              _buildInfoRow(
                                                "Area:",
                                                driver['driverArea'].toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              const SizedBox(height: 24),
                                              _buildInfoRow(
                                                "User Code:",
                                                driver['userCode'].toString(),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              // Edit Button
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                              //   children: [
                                              //     ElevatedButton.icon(
                                              //       style: ElevatedButton.styleFrom(
                                              //         foregroundColor: Colors.white,
                                              //         backgroundColor:
                                              //             Colors.deepOrangeAccent,
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
