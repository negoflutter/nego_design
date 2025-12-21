import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';
import 'package:nego_design/l10n/nego_localizations.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? labelText;
  final bool? filled;
  final Color? fillColor;
  final int? maxLength;
  final InputBorder? inputBorder;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;

  const InputPassword({
    super.key,
    this.label,
    this.labelText = 'Password',
    this.hintText = 'Enter your password',
    this.controller,
    this.maxLength,
    this.filled = true,
    this.fillColor = Colors.black12,
    this.inputBorder = InputBorder.none,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return InputField(
      key: widget.key,
      label: widget.label,
      filled: widget.filled,
      obscureText: _obscureText,
      fillColor: widget.fillColor,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      controller: widget.controller,
      inputBorder: widget.inputBorder,
      textInputAction: widget.textInputAction,
      textInputType: TextInputType.visiblePassword,
      hintText: NegoLocalizations.of(context)?.inputPasswordHintText ?? widget.hintText,
      labelText: NegoLocalizations.of(context)?.inputPasswordLabelText ?? widget.labelText,
      prefixIcon: Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(_obscureText? Icons.visibility_off_sharp : Icons.visibility_sharp),
        onPressed: () {
          setState(() { _obscureText = !_obscureText; });
        },
      ),
      validator: Validators.password,
    );
  }
}
