import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';
import 'package:nego_design/l10n/nego_localizations.dart';

class InputEmailOrPhone extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? labelText;
  final bool? filled;
  final Color? fillColor;
  final bool obscureText;
  final int? maxLength;
  final InputBorder? inputBorder;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const InputEmailOrPhone({
    super.key,
    this.label,
    this.labelText = 'Email or Telephone',
    this.hintText = 'Enter your email or contact details',
    this.controller,
    this.maxLength,
    this.obscureText = false,
    this.filled = true,
    this.fillColor,
    this.inputBorder,
    this.textInputAction,
    this.onChanged,
  });

  @override
  State<InputEmailOrPhone> createState() => _InputEmailOrPhoneState();
}

class _InputEmailOrPhoneState extends State<InputEmailOrPhone> {
  @override
  Widget build(BuildContext context) {
    return InputField(
      key: widget.key,
      label: widget.label,
      filled: widget.filled,
      fillColor: widget.fillColor,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      controller: widget.controller,
      inputBorder: widget.inputBorder,
      obscureText: widget.obscureText,
      textInputType: TextInputType.text,
      textInputAction: widget.textInputAction,
      hintText: NegoLocalizations.of(context)?.inputEmailOrPhoneHintText ?? widget.hintText,
      labelText: NegoLocalizations.of(context)?.inputEmailOrPhoneLabelText ?? widget.labelText,
      prefixIcon: Icon(Icons.perm_phone_msg_outlined),
      suffixIcon: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => widget.controller?.clear(),
      ),
      validator: Validators.emailOrPhone,
    );
  }
}
