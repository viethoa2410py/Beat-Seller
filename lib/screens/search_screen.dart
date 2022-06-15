import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/widgets/app_bar.dart';
import 'package:hotel_booking/widgets/recommend_item.dart';
import 'package:hotel_booking/widgets/search_widget.dart';

import 'beat_detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<BeatModel> beats = [];
  List<BeatModel> allBeats = [];
  String query = '';

  Future init() async {
    final allBeats = await BeatRepository.getAllBeats();

    setState(() {
      this.allBeats = allBeats;
      this.beats = allBeats;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: BaseAppBar.lightAppBar(context: context, titleString: "Search"),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: beats.length,
              itemBuilder: (context, index) {
                final beat = beats[index];

                return buildBeats(beat);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Type, Title or Producer Name',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final _beats = allBeats.where((beat) {
      final titleLower = beat.name.toLowerCase();
      final authorLower = beat.producer.name.toLowerCase();
      final typeLower = beat.type.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower) ||
          typeLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.beats = _beats;
    });
  }

  Widget buildBeats(BeatModel beatModel) => RecommendItem(
        data: beatModel,
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BeatDetail(
                        beat: beatModel,
                      )));
        },
      );
}
