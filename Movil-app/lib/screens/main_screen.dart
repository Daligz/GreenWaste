import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/screens/Profile/profile_screen.dart';
import 'package:movil_app/screens/reports/reports_screen.dart';
import 'package:movil_app/screens/rewards/rewards_screen.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/containers.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/screens/Containers/containers.dart';
import 'package:movil_app/screens/addContainer/add_container_screen.dart';
import 'addContainer/add_container_screen.dart';
import 'address/AddressRead/read_addres.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  User? user;
  final screens = [
    ContainersScreen(user: null),
    ProfileScreen(user: null),
    RewardScreen(user: null),
    ReportScreen(user: null),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        user = arguments['user'];
        screens.removeRange(0, 4);
        screens.add(ContainersScreen(user: user));
        screens.add(ProfileScreen(user: user));
        screens.add(RewardScreen(user: user));
        screens.add(ReportScreen(user: user));
        screens.add(ReportScreen(user: user));
        if(arguments['index']!=null){
          index = arguments['index'];
        }
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: kPrimaryLightColor,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            backgroundColor: kPrimaryLightColor,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.house_outlined,
                    color: kPrimaryDarkColor,
                  ),
                  selectedIcon: Icon(
                    Icons.house,
                    color: kPrimaryColor,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.account_box_outlined,
                    color: kPrimaryDarkColor,
                  ),
                  selectedIcon: Icon(
                    Icons.account_box,
                    color: kPrimaryColor,
                  ),
                  label: 'Perfil'),
              NavigationDestination(
                  icon: Icon(
                    Icons.wallet_giftcard_outlined,
                    color: kPrimaryDarkColor,
                  ),
                  selectedIcon: Icon(
                    Icons.wallet_giftcard,
                    color: kPrimaryColor,
                  ),
                  label: 'Premios'),
              NavigationDestination(
                  icon: Icon(
                    Icons.wallet_outlined,
                    color: kPrimaryDarkColor,
                  ),
                  selectedIcon: Icon(
                    Icons.wallet,
                    color: kPrimaryColor,
                  ),
                  label: 'Cartera'),
            ],
          ),
        ),
      );
}
