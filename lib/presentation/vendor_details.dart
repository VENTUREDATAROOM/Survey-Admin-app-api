import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/custom_text.dart';
import '../view_models/controller/dashboard_controller.dart';
import '../view_models/controller/vendor_controller.dart';

class VendorDetails extends StatefulWidget {
  final String userCode;
  const VendorDetails({super.key, required this.userCode});

  @override
  State<VendorDetails> createState() => _VendorDetailsState();
}

class _VendorDetailsState extends State<VendorDetails> {
  final VendorController vendorcontrol = Get.put(VendorController());
  final dashboardViewModelController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    // Fetch data on page initialization
    dashboardViewModelController.getVendorDetailsCount(widget.userCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Vendors",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),
      body: Obx(
        () => vendorcontrol.isLoading.value
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
                          CustomText("Vendors count".tr, 20, FontWeight.bold),
                          const Spacer(),
                          CustomText(
                              dashboardViewModelController.vendorCount.value
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
                      itemCount: vendorcontrol.vendors.length,
                      itemBuilder: (context, index) {
                        final vendor = vendorcontrol.vendors.value[index];
                        return (vendor['userCode'].toString() ==
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
                                        const Row(
                                          children: [
                                            Text(
                                              "Vendor Info",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow(
                                          "ID:",
                                          vendor['vendorId'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "User Code:",
                                          vendor['userCode'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Name:",
                                          vendor['vendorName'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Age:",
                                          vendor['age'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Type:",
                                          vendor['vendorType'].toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            const Text(
                                              "Contact",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              icon: Icon(
                                                Icons.call,
                                                color: Colors.blueGrey[700],
                                              ),
                                              onPressed:
                                                  () {}, // Implement call vendor functionality
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow(
                                          "Phone:",
                                          vendor['vendorNumber'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Alternate:",
                                          vendor['alternateNumber'].toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          children: [
                                            Text(
                                              "Addresses",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow(
                                          "Vendor:",
                                          vendor['vendorAddress'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Shop:",
                                          vendor['shopAddress'].toString(),
                                        ),
                                        const SizedBox(height: 16),
                                        const Row(
                                          children: [
                                            Text(
                                              "Details",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: Colors.grey[300]),
                                        const SizedBox(height: 12),
                                        _buildInfoRow(
                                          "Priority:",
                                          vendor['mandiPriority'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Mandi Visit:",
                                          vendor['mandiVisit'].toString(),
                                        ),
                                        _buildInfoRow(
                                          "Veggie Variety:",
                                          vendor['vegetableVariety'].toString(),
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
