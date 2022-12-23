import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:plix/features/authentication/presentation/login/login_screen.dart';
import 'package:plix/features/address/presentation/address_screen.dart';
import 'package:plix/features/product/presentation/product_detail_screen.dart';
import 'package:plix/widgets/app_drawer.dart';

import '../features/authentication/presentation/forget_pw/forget_pw_screen.dart';
import '../features/authentication/presentation/forget_pw/insertmail_screen.dart';
import '../features/authentication/presentation/signup/verifyotp/otp.dart';

import '../features/categories/presentation/category_search_screen.dart';
import '../features/checkout/presentation/payment_option.dart';
import '../features/authentication/presentation/signup/signup_screen.dart';

import '../features/dashboard/presentation/dashboard_main_screen.dart';
import '../features/dashboard/presentation/tabs/dashboard_screen.dart';
import '../features/leaverequest/presentation/leave_request_screen.dart';
import '../features/order_history/presentation/order_history_screen.dart';
import '../features/profile/presentation/profile_edit_screen.dart';
import '../features/profile/presentation/profle_screen.dart';
import '../features/show_all_search/presentation/show_all.dart';
import '../loading_screen.dart';

class Routes {
  static const String logInScreen = '/logIn';
  static const String signUpScreen = '/signUp';
  static const String appDrawer = '/drawer';
  static const String dashBoard = '/dashBoard';
  static const String home = '/home';
  static const String profileScreen = '/profileScreen';
  static const String profileEditScreen = '/ProfileEditScreen';
  static const String dashBoardMainScreen = '/DashBoardMainScreen';
  static const String leaveReqScreen = '/LeaveReqScreen';
  static const String searchScreen = '/SearchScreen';

  static const String productDetailScreen = '/ProductDetailScreen';
  static const String addressScreen = '/assdessScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String naviGationScreen = '/navigationScreen';
  static const String categorySearch = '/categorySearch';
  static const String verifyOtpScreen = '/verifyOtpScreen';
  static const String emailEntryScreen = '/emailEntryScreen';
  static const String loadingScreen = '/loadingScreen';
  static const String forgotPWScreen = '/forgotPWScreen';
  static const String sliderWebViewPage = '/sliderWebViewPage';
  static const String cartBottomSheet = '/cartBottomSheet';
  static const String orderHistoryScreen = '/orderHistoryScreen';
  static const String orderDetailsScreen = '/orderDetailsScreen';
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SignUpScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const SignUpScreen());
      case Routes.appDrawer:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const AppDrawer(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const AppDrawer());
      case Routes.logInScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const LogeinScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const LogeinScreen());
      case Routes.dashBoard:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const DashboardScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DashboardScreen());
      case Routes.loadingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const Loading(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => const Loading());
      case Routes.dashBoardMainScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const DashBoardMainScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(
                builder: (context) => const DashBoardMainScreen());
      case Routes.profileEditScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ProfileEditScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(
                builder: (context) => const ProfileEditScreen());
      case Routes.leaveReqScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const LeaveReqScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => const LeaveReqScreen());
      case Routes.searchScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SearchScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => const SearchScreen());
      case Routes.productDetailScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ProductDetailScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(
                builder: (context) => const ProductDetailScreen());
      case Routes.addressScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: AddressScreen(addressId: args['id']),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => AddressScreen());
      case Routes.orderHistoryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: OrderHistoryScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => OrderHistoryScreen());
      case Routes.paymentScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: PaymentScreen(orderID: args["orderID"]),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => PaymentScreen(orderID: args["orderID"]));

      case Routes.categorySearch:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CategorySearch(
                  allCategories: args["allCategories"],
                  catname: args["name"],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => CategorySearch(
                      allCategories: args["allCategories"],
                      catname: args["name"],
                    ));
      case Routes.verifyOtpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const VerifyOtpScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const VerifyOtpScreen());
      case Routes.emailEntryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InsertEmailScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => InsertEmailScreen());
      case Routes.profileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ProfileScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => ProfileScreen());
      case Routes.forgotPWScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ForgotPWScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => ForgotPWScreen());

      // case Routes.orderDetailsScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: OrderDetailsScreen(),
      //           settings:
      //               settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
      //       : CupertinoPageRoute(builder: (context) => OrderDetailsScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(microseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
              child: child,
            );
          },
        );
}
