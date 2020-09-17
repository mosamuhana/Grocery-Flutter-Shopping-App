import 'package:flutter/material.dart';

class IntCounter extends StatefulWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChange;

  IntCounter({
    Key key,
    this.value,
    this.min = 1,
    this.max = 10,
    this.onChange,
  })  : assert(min >= 1),
        assert(min < max);

  @override
  _IntCounterState createState() => _IntCounterState();
}

class _IntCounterState extends State<IntCounter> {
  int value = 1;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildButton(
          icon: Icons.remove,
          onPressed: !canDecrement ? null : decrement,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            value.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildButton(
          icon: Icons.add,
          onPressed: !canIncrement ? null : increment,
        ),
      ],
    );
  }

  Widget buildButton({IconData icon, Function onPressed}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }

  void increment() {
    value++;
    setState(() {});
    widget.onChange?.call(value);
  }

  void decrement() {
    value--;
    setState(() {});
    widget.onChange?.call(value);
  }

  bool get canIncrement => value < 10;
  bool get canDecrement => value > 1;
}
