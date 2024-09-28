import 'package:flutter/material.dart';

// 带禁用功能的按钮
class LoginButtonWidget extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  const LoginButtonWidget(this.title,
      {Key? key, this.enable = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      height: 45,
      onPressed: enable ? onPressed : null,
      color: Colors.orange,
      disabledColor: Colors.white60,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
