import 'package:flutter/material.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/widgets/custom_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icon_box.dart';

class MyBeatItem extends StatelessWidget {
  const MyBeatItem({Key? key, required this.data, this.onTap, this.onEdit})
      : super(key: key);
  final BeatModel data;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onEdit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                data.thumbnail.image,
                radius: 15,
                height: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.type.name,
                      style: const TextStyle(fontSize: 12, color: textColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: yellow,
                        ),
                        const SizedBox(
                          width: 3,
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
                  ],
                ),
              ),
              Column(
                children: [
                  IconBox(
                    onTap: onEdit,
                    bgColor: appBgColor,
                    child: SvgPicture.asset(
                      "assets/icons/edit.svg",
                      width: 18,
                      height: 18,
                    ),
                  ),
                  if (data.isSold)
                    Container(
                      height: 15,
                      width: 30,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.red)),
                      child: const Text(
                        "Sold out",
                        style: TextStyle(fontSize: 6, color: Colors.red),
                      ),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
