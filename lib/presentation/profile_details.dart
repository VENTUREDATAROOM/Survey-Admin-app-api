import 'package:admin_sabji/res/routes/routes_name.dart';
import 'package:admin_sabji/view_models/controller/profile_contrroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final ProfileController profilecont = Get.put(ProfileController());
  final TextEditingController searchController = TextEditingController();
  List<dynamic> filteredProfile = [];

  @override
  void initState() {
    super.initState();
    filteredProfile = profilecont.faces;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Surveyers",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),
      body: Obx(
        () => profilecont.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                          15.0), // Maintain rounded corners
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search by usercode',
                        prefixIcon: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: const Icon(Icons.search, size: 24.0),
                        ),
                        border: InputBorder.none, // Remove the default border
                      ),
                      onChanged: (value) {
                        setState(() {
                          filteredProfile = profilecont.faces
                              .where((prop) => prop['username']
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredProfile.length,
                        itemBuilder: (context, index) {
                          final profileData = filteredProfile[index];
                          return GestureDetector(
                            onTap: () {
                              // Retrieve the mobileno from the profileData
                              final mobileno = profileData["username"];

                              // Navigate to Homepage with the mobileno
                              Navigator.pushNamed(context, RouteName.homeView,
                                  arguments: mobileno);
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  border: Border.all(
                                      color: Colors.white, width: 2.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.shade400,
                                      Colors.grey.shade800
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // const CircleAvatar(
                                    //   radius: 50,
                                    //   backgroundImage: NetworkImage(
                                    //       "http://m.gettywallpapers.com/wp-content/uploads/2023/06/Pfp-Cool.jpg"), // Replace with actual image URL
                                    // ),
                                    const SizedBox(height: 15),
                                    Text(
                                      profileData["name"] ?? "N/A",
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      profileData["email"] ?? "N/A",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Mobile No:",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white)),
                                            Text(
                                                profileData["mobileno"] ??
                                                    "N/A",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Date of Birth:",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white)),
                                            Text(
                                                profileData["dateofbirth"] ??
                                                    "N/A",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Aadhar No:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          profileData["aadharNo"] ?? "N/A",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
