import '../widgets/custom_snackbar.dart';

void showError(String message) {
  showCustomSnackBar(title: "Error", message: message, type: SnackType.error);
}
