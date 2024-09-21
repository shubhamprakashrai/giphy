import 'package:flutter/material.dart';
import 'package:giphyapp/app/utils/app_constant/app_extension.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';

class CustomLoadingButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const CustomLoadingButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Disable if loading
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.purpleColors,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: const TextStyle(fontSize: 20)
                  .white
                  .w7, // Adjust as per your TextStyle
            ),
    );
  }
}
