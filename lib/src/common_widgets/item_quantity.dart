import 'package:flutter/material.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';

class QuantityBar extends StatefulWidget {
  final int initialQuantity;
  final int minQuantity;
  final int maxQuantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantityBar({
    super.key,
    this.initialQuantity = 1,
    this.minQuantity = 1,
    this.maxQuantity = 10,
    required this.onQuantityChanged,
  });

  @override
  State<QuantityBar> createState() => _QuantityBarState();
}

class _QuantityBarState extends State<QuantityBar> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
      });
      widget.onQuantityChanged(_quantity);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > widget.minQuantity) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(width: 1, color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            disabledColor: Colors.grey,
            color: Colors.blue,
            tooltip: 'Decrease quantity',
            onPressed: _quantity > widget.minQuantity
                ? _decreaseQuantity
                : null,
          ),
          gbWd10,
          Text(
            '$_quantity',
            style: const TextStyle(fontSize: 18),
          ),
          gbWd10,
          IconButton(
            icon: const Icon(Icons.add),
            //onPressed: _increaseQuantity,
            color: Colors.blue,
            tooltip: 'Increase quantity',
            onPressed: _quantity < widget.maxQuantity
                ? _increaseQuantity
                : null,
          ),
        ],
      ),
    );
  }
}
