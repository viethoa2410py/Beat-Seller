import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/screens/beat_detail.dart';
import 'package:hotel_booking/screens/my_beat/create_beat.dart';
import 'package:hotel_booking/screens/my_cart/my_cart.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/widgets/my_beat_item.dart';
import 'package:hotel_booking/widgets/notification_box.dart';

class MyBeats extends StatefulWidget {
  const MyBeats({Key? key}) : super(key: key);

  @override
  State<MyBeats> createState() => _MyBeatsState();
}

class _MyBeatsState extends State<MyBeats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            _AppBarWidget(),
            SliverToBoxAdapter(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ButtonCreateBeat(),
                    SizedBox(height: 20),
                    BlocListener<BeatBloc, BeatState>(
                      listener: (context, state) {
                        if (state.uploadStatus == UploadStatus.complete) {
                          setState(() {});
                        }
                      },
                      child: FutureBuilder(
                          future: BeatRepository.getMyBeats(
                              UserRepository.currentUser!.id),
                          builder: (context,
                              AsyncSnapshot<List<BeatModel>> snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done)
                              return Center(child: CircularProgressIndicator());
                            else {
                              if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                return Column(
                                  children: List.generate(
                                    snapshot.data!.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: MyBeatItem(
                                        data: snapshot.data![index],
                                        onTap: () async {
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BeatDetail(
                                                        beat: snapshot
                                                            .data![index],
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
                          }),
                    )
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}

class _ButtonCreateBeat extends StatelessWidget {
  const _ButtonCreateBeat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateBeat()));
      },
      child: Container(
        width: 120,
        height: 40,
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(0, 1))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: textBoxColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Upload\nBeat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: textBoxColor,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: appBarColor,
      pinned: true,
      snap: true,
      floating: true,
      centerTitle: true,
      title: Text(
        "My Beats",
        style: TextStyle(
          color: darker,
          fontSize: 16,
        ),
      ),
      actions: [
        if (UserRepository.currentUser!.role != "Admin")
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: NotificationBox(
              notifiedNumber: 1,
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyCart())));
              },
            ),
          )
      ],
    );
  }
}
