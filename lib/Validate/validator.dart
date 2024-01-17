class Validator {
  static isValidEmail (String email) {
    RegExp emailValid = RegExp(r"\S+@\S+\.\S+");

    return emailValid.hasMatch(email);
  }
  static isValidPassword (String password) {
    RegExp passwordValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

    return passwordValid.hasMatch(password);
  }
}