import 'package:flutter/material.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';

class CustomLogoutDialog extends StatelessWidget {
  final VoidCallback onLogout;

  const CustomLogoutDialog({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            const Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: AppColors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              "Logout",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Are you sure you want to logout?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Cancel"),
                ),

                // Logout Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Close dialog, confirm logout
                    onLogout(); // Trigger the logout callback
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red, // Use backgroundColor instead of primary
                    foregroundColor: AppColors.white, // Use foregroundColor instead of onPrimary
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Logout"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
