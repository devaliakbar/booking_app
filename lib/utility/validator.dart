isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);
}

isValidAlphabetes(String string) {
  return RegExp(r"^[a-zA-Z .]*$").hasMatch(string);
}

isValidPhone(String phone) {
  return RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(phone);
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }

  try {
    double.parse(s);
    return true;
  } catch (e) {
    return false;
  }
}
