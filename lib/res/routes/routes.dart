import 'package:admin_sabji/presentation/profile_details.dart';
import 'package:get/get.dart';

import '../../view/home_view.dart';
import '../../view/language_screen.dart';
import '../../view/login_view.dart';
import '../../view/registration_view.dart';
import '../../view/splash_screen.dart';
import '../components/internet_exception_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.languageScreen,
            page: () => const LanguageScreen(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.registrationView,
            page: () => const RegistrationView(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.homeView,
            page: () => HomeView(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.profileView,
            page: () => const ProfileDetails(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.internetExceptionView,
            page: () => InternetExceptionWidget(
                  onPress: () {},
                ),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
      ];
}
