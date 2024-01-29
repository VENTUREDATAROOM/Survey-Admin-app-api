import 'package:admin_sabji/presentation/crop_details.dart';
import 'package:admin_sabji/presentation/driver_details.dart';
import 'package:admin_sabji/presentation/farmer_details.dart';
import 'package:admin_sabji/presentation/vendor_details.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  String? userName;
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  Widget buildPages() {
    userName = ModalRoute.of(context)!.settings.arguments as String?;
    switch (_selectedIndex) {
      case 1:
        return DriverDetails(
          userCode: userName.toString(),
        );
      case 2:
        return FarmerDetails(
          userCode: userName.toString(),
        );

      case 3:
        return VendorDetails(
          userCode: userName.toString(),
        );
      case 0:
      default:
        return CropDetails(
          userCode: userName.toString(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationMenu(context),
    );
  }

  buildBottomNavigationMenu(context) {
    return SizedBox(
      height: 60,
      child: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.purple,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        items: [
          Image.asset(
            'assets/images/wheat.png',
            height: 30,
            color: Colors.green,
          ),
          Image.asset(
            'assets/images/tractor.png',
            height: 30,
            color: Colors.deepOrangeAccent,
          ),
          Image.asset(
            'assets/images/farmer.png',
            height: 30,
          ),
          Image.asset(
            'assets/images/vendor.png',
            height: 30,
            color: Colors.amber,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
