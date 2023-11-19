import 'dart:developer';

class StringUtil {
  static String getInitials(String string) {
    String initials = "";
    int letterCount = 0;
    try {
      if (string.isEmpty) {
        return "NA";
      }
      List<String> names = string.split(" ");
      for (String name in names) {
        if (name.isNotEmpty) {
          initials += name[0];
          letterCount++;
          if (letterCount >= 2) {
            break; // Stop after adding two letters
          }
        }
      }
      return initials.toUpperCase();
    } catch (e) {
      log("StringUtil:getInitials:$e");
      return initials.toUpperCase();
    }
  }
}
