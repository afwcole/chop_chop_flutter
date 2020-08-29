import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxExtrasTile extends StatelessWidget{
  final Checkbox checkbox;
  final Text text;
  final double price;

  CheckboxExtrasTile({
    @required this.checkbox,
    @required this.text,
    this.price = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: checkbox,
      title: Text(text.data, style: Theme.of(context).textTheme.body1),
      subtitle: Text(
          "\$" + price.toStringAsFixed(2),
          style: Theme.of(context).textTheme.body1
              .copyWith(color: Color(0xFF535353))),
      dense: true,
      onTap: checkbox.onChanged != null ? () {
        checkbox.onChanged(!checkbox.value);
      } : null,
    );
  }
}