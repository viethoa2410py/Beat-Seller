import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/screens/my_cart/checkout.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/snack_bar.dart';
import 'package:hotel_booking/widgets/custom_image.dart';

class BeatDetail extends StatefulWidget {
  final BeatModel beat;
  const BeatDetail({Key? key, required this.beat}) : super(key: key);

  @override
  State<BeatDetail> createState() => _BeatDetailState();
}

class _BeatDetailState extends State<BeatDetail> {
  @override
  void initState() {
    AppBloc.audioPlayerBloc.add(InitialAudio(widget.beat));
    super.initState();
  }

  @override
  void dispose() {
    AppBloc.audioPlayerBloc.add(PauseAudio());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: CustomImage(
                      widget.beat.thumbnail.image,
                      width: _size.width,
                      radius: 0,
                      height: _size.height / 4,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.beat.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            BlocSelector<AudioPlayerBloc, AudioPlayerState,
                                AudioState>(
                              selector: (state) {
                                return state.audioState;
                              },
                              builder: (context, audioState) {
                                return IconButton(
                                    onPressed: () {
                                      if (audioState == AudioState.playing) {
                                        AppBloc.audioPlayerBloc
                                            .add(PauseAudio());
                                      } else {
                                        AppBloc.audioPlayerBloc
                                            .add(PlayAudio());
                                      }
                                    },
                                    icon: Icon(audioState == AudioState.playing
                                        ? Icons.pause_circle
                                        : Icons.play_circle));
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        _DescWidget(widget: widget)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                child: IconButton(
              icon: Icon(Icons.cancel_outlined),
              color: primary,
              onPressed: () {
                 AppBloc.audioPlayerBloc.add(PauseAudio());
                Navigator.pop(context);
              },
            )),
            if (UserRepository.currentUser!.role != "Admin")
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: _ButtonWidget(
                  beat: widget.beat,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key, required this.beat}) : super(key: key);
  final BeatModel beat;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                await BeatRepository.addToCart(
                    UserRepository.currentUser!.id, beat);
                ScaffoldMessenger.of(context).showSnackBar(
                    ExpandedSnackBar.successSnackBar(
                        context, "Added " + beat.name + " to cart"));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: inActiveColor,
                    borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 14, color: primary),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Checkout(
                              beatsToBuy: [beat],
                            )));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 14, color: textBoxColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DescWidget extends StatelessWidget {
  const _DescWidget({Key? key, required this.widget}) : super(key: key);

  final BeatDetail widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
              text: "Producer's name: ",
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: widget.beat.producer.name,
                    style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500))
              ]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.beat.type.name,
          style: TextStyle(fontSize: 12, color: textColor),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "\$${widget.beat.discount}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            if (widget.beat.discount != widget.beat.price)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "\$${widget.beat.price}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    color: labelColor,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
              text: "Description: ",
              style: TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                    text: widget.beat.description,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: textColor,
                    ))
              ]),
        ),
      ],
    );
  }
}
