import 'package:beatSeller/screens/chat/chatbot_screen.dart';
import 'package:flutter/material.dart';
import 'package:beatSeller/repository/user_repository.dart';
import 'package:beatSeller/screens/my_beat/my_beats.dart';
import 'package:beatSeller/screens/search_screen.dart';
import 'package:beatSeller/screens/setting.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/utils/constant.dart';
import 'package:beatSeller/widgets/bottombar_item.dart';

import 'home.dart';

class RootApp extends StatefulWidget {
  static const id = "RootApp";
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int activeTabIndex = 0;
  List barItems = [];
  List barItemsAdmin = [
    {
      "icon": "assets/icons/home.svg",
      "page": const HomePage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "page": const SearchScreen(),
    },
    {
      "icon": "assets/icons/sound.svg",
      "page": const MyBeats(),
    },
    {
      "icon": "assets/icons/setting.svg",
      "page": const SettingPage(),
    },
  ];
  List barItemsUser = [
    {
      "icon": "assets/icons/home.svg",
      "page": const HomePage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "page": const SearchScreen(),
    },
    {
      "icon": "assets/icons/setting.svg",
      "page": const SettingPage(),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    if (UserRepository.currentUser != null &&
        UserRepository.currentUser!.role == "Admin") {
      setState(() {
        barItems = barItemsAdmin;
      });
    } else {
      setState(() {
        barItems = barItemsUser;
      });
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (index == activeTabIndex) return;
    _controller.reset();
    setState(() {
      activeTabIndex = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: getBottomBar(),
      body: getBarPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTabIndex,
        children: List.generate(
            barItems.length, (index) => animatedPage(barItems[index]["page"])));
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            barItems.length,
            (index) => BottomBarItem(
              barItems[index]["icon"],
              isActive: activeTabIndex == index,
              activeColor: primary,
              onTap: () {
                onPageChanged(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
