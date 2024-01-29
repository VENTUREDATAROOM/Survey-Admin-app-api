class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return ' Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return ' Password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return ' Name is too short.';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return ' Text is too short.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter a mobile number.';
    } else if (value.length != 10) {
      return 'Mobile number should be 10 digits long.';
    } else {
      return null;
    }
  }

  static String? validateAmountNumber(String value) {
    print(value);
    if (value.isEmpty) {
      return ' Amount is not valid.';
    } else {
      return null;
    }
  }

  static String? validateAddress(String value) {
    print(value);
    if (value.isEmpty) {
      return ' Address is not valid.';
    } else {
      return null;
    }
  }
}
