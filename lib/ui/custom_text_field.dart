import 'package:gbs/global_export.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool? isPassword;

  const CustomTextField(
      {super.key, required this.controller, required this.hint, this.isPassword});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passwordVisible,
      style: const TextStyle(
          fontSize: 14, color: black, fontWeight: FontWeight.w500),
      controller: widget.controller,
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: 30, maxHeight: 60),
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: grayLight,
        suffixIcon: widget.isPassword==true? IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                passwordVisible = !passwordVisible;
              },
            );
          },
        ):null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 15.0, color: black),
        ),
        counter: const SizedBox(),
        hintText: widget.hint,
        hintStyle: const TextStyle(
            fontSize: 14, color: black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
