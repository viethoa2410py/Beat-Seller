import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/models/model_coupon.dart';
import 'package:hotel_booking/screens/beat_detail.dart';
import 'package:hotel_booking/screens/my_cart/popup_coupon.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/snack_bar.dart';
import 'package:hotel_booking/widgets/cart_item.dart';

import 'checkout.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    AppBloc.cartBloc.add(LoadData());
    super.initState();
  }

  List<BeatModel> listBeatBuy = [];
  CouponModel? coupon;
  loadTotalPrice() {
    var totalPrice = 0.0;
    if (listBeatBuy.isNotEmpty) {
      for (var _item in listBeatBuy) {
        totalPrice += _item.discount;
      }
    }
    return totalPrice;
  }

  loadCouponPrice() {
    var totalPriceSave = 0.0;
    if (coupon != null) {
      totalPriceSave = loadTotalPrice() * coupon!.value;
    }
    return totalPriceSave;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBgColor,
        bottomSheet: BlocSelector<CartBloc, CartState, List<BeatModel>>(
          selector: (state) {
            return state.beats;
          },
          builder: (context, beats) {
            if (beats.isEmpty) {
              return SizedBox();
            }
            return Container(
              height: 160,
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      var result = await showAnimatedDialog<CouponModel?>(
                          context: context,
                          barrierDismissible: true,
                          animationType: DialogTransitionType.scale,
                          builder: (BuildContext context) => PopupCoupon());
                      setState(() {
                        coupon = result;
                      });
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: inActiveColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("ADD A COUPON",
                          style: TextStyle(color: primary)),
                    ),
                  ),
                  if (coupon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("You choose voucher: ${coupon!.code}",
                          style: TextStyle(color: mainColor, fontSize: 12)),
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                        color: labelColor, fontSize: 12)),
                                Text(loadTotalPrice().toString(),
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Saving",
                                    style: TextStyle(
                                        color: labelColor, fontSize: 12)),
                                Text(loadCouponPrice().toString(),
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (listBeatBuy.isNotEmpty)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Checkout(beatsToBuy: listBeatBuy)));
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    ExpandedSnackBar.failureSnackBar(context,
                                        "Please choose at least one beat to pay"));
                              }
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Buy Now",
                                  style: TextStyle(color: textBoxColor)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
        body: CustomScrollView(
          slivers: [
            _AppBarWidget(),
            SliverToBoxAdapter(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BlocSelector<CartBloc, CartState, List<BeatModel>>(
                      selector: (state) {
                        return state.beats;
                      },
                      builder: (context, beats) {
                        if (beats.isEmpty) {
                          return Center(
                            child: Text(
                              "No had data",
                              style: TextStyle(color: mainColor, fontSize: 14),
                            ),
                          );
                        }
                        return Column(
                          children: List.generate(
                            beats.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CartItem(
                                data: beats[index],
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    listBeatBuy.add(beats[index]);
                                  } else {
                                    listBeatBuy.removeWhere((element) =>
                                        element.id == beats[index].id);
                                  }
                                  setState(() {});
                                },
                                onTap: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BeatDetail(
                                                beat: beats[index],
                                              )));
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            )),
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
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: darker,
        ),
      ),
      title: Text(
        "My Cart",
        style: TextStyle(
          color: darker,
          fontSize: 16,
        ),
      ),
    );
  }
}
