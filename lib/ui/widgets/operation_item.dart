import 'package:flutter/cupertino.dart';
import 'package:food/core/extension/int_extension.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _text;
  const OperationItem(this._icon, this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_icon, SizedBox(width: 3.px), Text(_text)],
    );
  }
}
