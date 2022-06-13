import 'package:flutter/material.dart';
import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/models/model_coupon.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/screens/my_cart/complete.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/widget_extension.dart';
import 'package:hotel_booking/widgets/coupon_item.dart';
import 'package:hotel_booking/widgets/text_input_field.dart';

class Checkout extends StatefulWidget {
  final List<BeatModel> beatsToBuy;
  const Checkout({Key? key, required this.beatsToBuy}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController _emailController = TextEditingController();
  loadSubTotalPrice() {
    var totalPrice = 0.0;
    if (widget.beatsToBuy.isNotEmpty) {
      for (var _item in widget.beatsToBuy) {
        totalPrice += _item.discount;
      }
    }
    return totalPrice;
  }

  loadTotalPrice() {
    var totalPrice = 0.0;
    totalPrice = loadSubTotalPrice() - loadTotalPriceDiscount();
    return totalPrice;
  }

  loadTotalPriceDiscount() {
    var totalDiscountPrice = 0.0;
    if (coupon != null) {
      totalDiscountPrice = loadSubTotalPrice() * coupon!.value;
    }
    return totalDiscountPrice;
  }

  CouponModel? coupon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darker,
      body: CustomScrollView(
        slivers: [
          _AppBarWidget(),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  color: appBgColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.only(top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      'Email'.desc().marg(0, 0, 20),
                      AppTextInputField.authVisibleInputText(
                        hintText: UserRepository.currentUser!.email,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Input your mail";
                          }
                          return null;
                        },
                      ).marg(0, 0, 6, 20),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: appBgColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        'Your Order'.desc().marg(0, 0, 20),
                        Column(
                          children: List.generate(
                            widget.beatsToBuy.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.beatsToBuy[index].name.desc(),
                                  widget.beatsToBuy[index].discount
                                      .toString()
                                      .desc(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Subtotal'.desc(),
                            loadSubTotalPrice().toString().desc()
                          ],
                        ),
                      ]),
                ),
                FutureBuilder(
                    future: BeatRepository.getCoupons(),
                    builder:
                        (context, AsyncSnapshot<List<CouponModel>> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) return SizedBox();

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            snapshot.data!.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CouponItem(
                                coupon: snapshot.data![index],
                                onTap: () {
                                  setState(() {
                                    coupon = snapshot.data![index];
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            )),
          )
        ],
      ),
      bottomSheet: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (coupon != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("You choose voucher: ${coupon!.code}",
                    style: TextStyle(color: mainColor, fontSize: 12)),
              ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: inActiveColor, fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$ ${loadTotalPrice()}",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        await BeatRepository.soldBeat(
                            UserRepository.currentUser!.id, widget.beatsToBuy);
                        AppBloc.cartBloc.add(LoadData());
                        AppBloc.beatBloc
                            .add(ChangeStatus(UploadStatus.complete));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Complete()));
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Order",
                            style: TextStyle(color: textBoxColor)),
                      ),
                    ),
                  ),
                )
              ],
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
        "Checkout",
        style: TextStyle(
          color: darker,
          fontSize: 16,
        ),
      ),
    );
  }
}
