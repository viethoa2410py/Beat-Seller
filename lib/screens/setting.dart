import 'dart:io';

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
import 'package:image_picker/image_picker.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;
  _loadImage(ImageSource source) async {
    try {
      final XFile? result = await _picker.pickImage(
        source: source,
      );
      if (result != null) {
        setState(() {
          pickedFile = result;
        });
        UserRepository.updateInfo(File(pickedFile!.path));
      }
    } catch (e) {
      print(e);
    }
  }

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
              centerTitle: true,
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
      child: const Text(
        "Setting",
        style: TextStyle(
            color: textColor, fontSize: 24, fontWeight: FontWeight.w600),
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
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    pickedFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.file(
                                  File(pickedFile!.path),
                                  fit: BoxFit.cover,
                                )),
                          )
                        : CustomImage(
                            UserRepository.currentUser != null &&
                                    UserRepository.currentUser!.avatar != null
                                ? UserRepository.currentUser!.avatar!
                                : "assets/icons/login.png",
                            width: 80,
                            height: 80,
                            radius: 50,
                            isNetwork: UserRepository.currentUser != null &&
                                UserRepository.currentUser!.avatar != null,
                          ),
                    IconBox(
                      onTap: () {
                        _displayPickImageDialog(context, (source) async {
                          await _loadImage(source);
                          Navigator.pop(context);
                        });
                      },
                      bgColor: appBgColor,
                      child: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ],
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

  Future<void> _displayPickImageDialog(
      BuildContext context, Function(ImageSource) onPick) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: const Text("Upload avatar"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              onPick(ImageSource.camera);
            },
            child: const Text(
              "Camera",
              style: TextStyle(color: actionColor),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              onPick(ImageSource.gallery);
            },
            child: const Text(
              "Gallery",
              style: TextStyle(color: actionColor),
            ),
          )
        ],
      ),
    );
  }
}
