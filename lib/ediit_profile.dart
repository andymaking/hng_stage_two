import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController userNameController;
  final TextEditingController githubHandleController;
  final TextEditingController bioBriefController;
  const EditProfileScreen({Key? key, required this.fullNameController, required this.userNameController, required this.githubHandleController, required this.bioBriefController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit My Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Full Name: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          CustomInputText(controller: fullNameController,),
          const SizedBox(height: 16,),
          const Text("Username: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          CustomInputText(controller: userNameController,),
          const SizedBox(height: 16, ),
          const Text("GitHub Handle: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          CustomInputText(controller: githubHandleController,),
          const SizedBox(height: 16,),
          const Text("About Me: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          CustomInputText(controller: bioBriefController, maxLine: 6,),
          const SizedBox(height: 16,),
          Buttons( text: "Submit", onTap:  Navigator.of(context).pop,)
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Buttons({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.black),
        backgroundColor: Colors.grey.withOpacity(0.3)
      ),
      onPressed: onTap,
      child: Text(text, style: TextStyle(fontSize: 17, color: Colors.black),)
    );
  }
}


class CustomInputText extends StatelessWidget {
  const CustomInputText({
    Key? key,
    this.inputType,
    this.textColor,
    this.color,
    this.prefix,
    this.label,
    this.onChangeVal,
    this.suffix,
    this.obscure,
    this.onChange,
    this.maxLine,
    this.hintText,
    this.controller,
    this.validator,
    this.style,
    this.autovalidateMode, this.onChanged,
  }) : super(key: key);
  final Widget? prefix;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffix;
  final Color? color;
  final Color? textColor;
  final String? label;
  final String? hintText;
  final bool? obscure;
  final Function(String)? onChanged;
  final String? onChangeVal;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Function? onChange;
  final int? maxLine;
  final TextStyle? style;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    AutovalidateMode _autovalidateMode = AutovalidateMode.onUserInteraction;

    final fontSize = style?.fontSize == null
        ? 16 / MediaQuery.textScaleFactorOf(context)
        : style!.fontSize! / MediaQuery.textScaleFactorOf(context);
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscure ?? false,
      validator: validator,
      autovalidateMode: _autovalidateMode,
      maxLines: maxLine,
      textInputAction: TextInputAction.next,
      controller: controller,
      onChanged: onChanged,
      cursorColor: textColor,
      // maxLines: 1 ?? 1 ,
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 10),
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: color ?? Colors.black.withOpacity(.4),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: color ?? Colors.blueAccent.withOpacity(.4),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}