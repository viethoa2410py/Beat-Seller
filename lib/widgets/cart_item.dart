import 'package:flutter/material.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/widgets/custom_image.dart';

class CartItem extends StatefulWidget {
  const CartItem(
      {Key? key, required this.data, this.onTap, required this.onSelected})
      : super(key: key);
  final BeatModel data;
  final GestureTapCallback? onTap;
  final Function(bool) onSelected;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          children: [
            SizedBox(
              width: 30,
              child: Checkbox(
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value!;
                  });
                  widget.onSelected(isCheck);
                },
              ),
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: Row(
                children: [
                  CustomImage(
                    widget.data.thumbnail.image,
                    radius: 15,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.data.type.name,
                        style: TextStyle(fontSize: 12, color: textColor),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
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
                                "\$${widget.data.discount}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                              if (widget.data.discount != widget.data.price)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "\$${widget.data.price}",
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
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
