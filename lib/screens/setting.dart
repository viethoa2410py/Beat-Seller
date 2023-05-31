import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/blocs/bloc.dart';
import 'package:beatSeller/repository/repository.dart';

import 'package:beatSeller/screens/auth/login_page.dart';
import 'package:beatSeller/theme/color.dart';

import 'package:beatSeller/widgets/custom_image.dart';
import 'package:beatSeller/widgets/icon_box.dart';
import 'package:beatSeller/widgets/setting_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              leading: Container(),
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ));
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Setting",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconBox(
            bgColor: appBgColor,
            child: SvgPicture.asset(
              "assets/icons/edit.svg",
              width: 18,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                CustomImage(
                  "assets/icons/login.png",
                  width: 80,
                  height: 80,
                  radius: 50,
                  isNetwork: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  UserRepository.currentUser != null
                      ? UserRepository.currentUser!.displayName
                      : "Display Name",
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  UserRepository.currentUser != null
                      ? UserRepository.currentUser!.email
                      : "",
                  style: const TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SettingItem(
              title: "General Setting",
              leadingIcon: Icons.settings,
              leadingIconColor: orange,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Bookings",
              leadingIcon: Icons.bookmark_border,
              leadingIconColor: blue,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Favorites",
              leadingIcon: Icons.favorite,
              leadingIconColor: red,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Privacy",
              leadingIcon: Icons.privacy_tip_outlined,
              leadingIconColor: green,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
            title: "Log Out",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.grey.shade400,
            onTap: () {
              showConfirmLogout();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: const Text("Would you like to log out?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              AppBloc.authenticationBloc.add(const Logout());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              "Log Out",
              style: TextStyle(color: actionColor),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
