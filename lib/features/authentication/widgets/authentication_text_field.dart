import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_weather_flutter_app/config/themes.dart';

class AuthenticationTextField extends StatefulWidget {
  const AuthenticationTextField(
      {super.key, this.useObscureSuffix = false, required this.label, required this.controller});

  final bool useObscureSuffix;
  final String label;
  final TextEditingController controller;

  @override
  State<AuthenticationTextField> createState() => _AuthenticationTextFieldState();
}

class _AuthenticationTextFieldState extends State<AuthenticationTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: black),
      cursorHeight: 15,
      cursorWidth: 1,
      cursorColor: red,
      keyboardType: TextInputType.emailAddress,
      obscureText: isObscure && widget.useObscureSuffix,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        constraints: const BoxConstraints(
          maxWidth: 400,
          minHeight: 96,
        ),
        contentPadding: const EdgeInsets.only(bottom: 14),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: lightGrey,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: blue,
            width: 2,
          ),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        label: Text(widget.label),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: widget.useObscureSuffix
            ? GestureDetector(
                onTap: () => setState(() => isObscure = !isObscure),
                child: isObscure
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: SvgPicture.asset('assets/icons/eye-off.svg'),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 14),
                        child: SvgPicture.asset('assets/icons/eye.svg'),
                      ),
              )
            : null,
      ),
    );
  }
}
