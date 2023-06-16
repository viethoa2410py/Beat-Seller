import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/blocs/bloc.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/repository/repository.dart';
import 'package:beatSeller/screens/my_cart/checkout.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/utils/snack_bar.dart';
import 'package:beatSeller/widgets/custom_image.dart';

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
    AppBloc.audioPlayerBloc.add(const PauseAudio());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      width: size.width,
                      radius: 0,
                      height: size.height / 4,
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
                                style: const TextStyle(
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
                                            .add(const PauseAudio());
                                      } else {
                                        AppBloc.audioPlayerBloc
                                            .add(const PlayAudio());
                                      }
                                    },
                                    icon: Icon(audioState == AudioState.playing
                                        ? Icons.pause_circle
                                        : Icons.play_circle));
                              },
                            )
                          ],
                        ),
                        const SizedBox(
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
              icon: const Icon(Icons.cancel_outlined),
              color: primary,
              onPressed: () {
                AppBloc.audioPlayerBloc.add(const PauseAudio());
                Navigator.pop(context);
              },
            )),
            if (UserRepository.currentUser != null &&
                UserRepository.currentUser!.role != "Admin")
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
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
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
                        context, "Added ${beat.name} to cart"));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: inActiveColor,
                    borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 14, color: primary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                child: const Text(
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
              style: const TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: widget.beat.producer.name,
                    style: const TextStyle(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500))
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.beat.type.name,
          style: const TextStyle(fontSize: 12, color: textColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "\$${widget.beat.discount}",
              style: const TextStyle(
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
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    color: labelColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
              text: "Description: ",
              style: const TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                    text: widget.beat.description,
                    style: const TextStyle(
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
