import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/Address/presentation/address_widget.dart';
import 'package:shop_it_all/src/features/payment/presentation/payment_widget.dart';

class MiddleInfo extends StatelessWidget {
  const MiddleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HorizontalBar(barMargin: EdgeInsets.all(0)),
        gbHt20,
        AddressWidget(),
        gbHt20,
        HorizontalBar(barMargin: EdgeInsets.all(0)),
        gbHt20,
        PaymentWidget()
      ],
    );
  }
}

