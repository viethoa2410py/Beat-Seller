import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/screens/my_cart/my_cart.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/data.dart';
import 'package:hotel_booking/widgets/type_beat_item.dart';
import 'package:hotel_booking/widgets/feature_item.dart';
import 'package:hotel_booking/widgets/notification_box.dart';
import 'package:hotel_booking/widgets/recommend_item.dart';

import 'beat_detail.dart';

class HomePage extends StatefulWidget {
  static const id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    color: labelColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Ho Chi Minh City",
                    style: TextStyle(
                      color: darker,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          if (UserRepository.currentUser!.role != "Admin")
            NotificationBox(
              notifiedNumber: 1,
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyCart())));
              },
            )
        ],
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Text(
                "Find and Get",
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Text(
                "The Best Beats",
                style: TextStyle(
                  color: labelColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            _TypeOfBeatWidget(),
            SizedBox(
              height: 10,
            ),
            BlocListener<BeatBloc, BeatState>(
              listener: (context, state) {
                if (state.uploadStatus == UploadStatus.complete) {
                  setState(() {});
                }
              },
              child: Column(
                children: [
                  _NewBeatWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  _RecommendedBeatWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecommendedBeatWidget extends StatelessWidget {
  const _RecommendedBeatWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: labelColor),
              ),
              Text(
                "See all",
                style: TextStyle(fontSize: 14, color: labelColor),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
                future: BeatRepository.getRecommendedBeats(),
                builder: (context, AsyncSnapshot<List<BeatModel>> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Center(child: CircularProgressIndicator());
                  else {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Row(
                        children: List.generate(
                          snapshot.data!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: RecommendItem(
                              data: snapshot.data![index],
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BeatDetail(
                                              beat: snapshot.data![index],
                                            )));
                              },
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          "No data available",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: labelColor),
                        ),
                      );
                    }
                  }
                }))
      ],
    );
  }
}

class _NewBeatWidget extends StatefulWidget {
  const _NewBeatWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_NewBeatWidget> createState() => _NewBeatWidgetState();
}

class _NewBeatWidgetState extends State<_NewBeatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Text(
            "New Beat",
            style: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        FutureBuilder(
            future: BeatRepository.getNewBeats(),
            builder: (context, AsyncSnapshot<List<BeatModel>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return Center(child: CircularProgressIndicator());
              else {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .75,
                    ),
                    items: List.generate(
                      snapshot.data!.length,
                      (index) => FeatureItem(
                        data: snapshot.data![index],
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BeatDetail(
                                        beat: snapshot.data![index],
                                      )));
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "No data available",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: labelColor),
                    ),
                  );
                }
              }
            }),
      ],
    );
  }
}

class _TypeOfBeatWidget extends StatelessWidget {
  const _TypeOfBeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            types.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TypeBeatItem(
                data: types[index],
                onTap: () async {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
