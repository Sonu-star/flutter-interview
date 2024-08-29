import 'package:gbs/global_export.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Get.width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(10)),
        child: Text(
          buttonName,
          style: const TextStyle(
              fontSize: 18, color: white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
