import 'package:flutter/material.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/theme/color.dart';
import 'custom_image.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem(
      {Key? key,
      required this.data,
      this.width = 280,
      this.height = 300,
      this.onTap,
      this.onTapFavorite})
      : super(key: key);
  final BeatModel data;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomImage(
                data.thumbnail.image,
                width: double.infinity,
                radius: 15,
              ),
            ),
            Container(
              width: width - 20,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.type.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(color: textColor, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${data.discount}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                              if (data.discount != data.price)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "\$${data.price}",
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
                        ],
                      ),
                      // FavoriteBox(
                      //   size: 16,
                      //   onTap: onTapFavorite,
                      //   isFavorited: data["is_favorited"],
                      // )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
