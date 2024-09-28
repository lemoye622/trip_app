import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hint; // 输入框默认提示文字
  final ValueChanged<String>? onChanged; // 输入框内容发生变化时的回调函数
  final bool isObscureText; // 是否隐藏输入内容
  final TextInputType? keyboardType; // 键盘输入类型

  const InputWidget(this.hint, // 必填项也可以移除可选参数之外写到这里，此时可以省略 required
      {Key? key,
      this.onChanged,
      // required this.isObscureText,
      this.isObscureText = false, // 给必填参数设置默认值的时候，也可以省略 required
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input(),
        const Divider(
          height: 1,
          color: Colors.white,
          thickness: 0.5, // 设置粗细
        )
      ],
    );
  }

  _input() {
    return TextField(
      onChanged: onChanged,
      obscureText: isObscureText,
      keyboardType: keyboardType,
      autofocus: !isObscureText,
      cursorColor: Colors.white, // 光标颜色
      // 文字样式
      style: const TextStyle(
          fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),
      // 输入框样式
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 17, color: Colors.grey)),
    );
  }
}
