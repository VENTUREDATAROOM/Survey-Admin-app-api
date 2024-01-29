class AppUrl {
  static const String baseUrl = 'http://159.89.172.204:8009';
  static const String loginUrl = '$baseUrl/auth/authenticate';
  static const String registerUrl = '$baseUrl/auth/registerToApp';

  static const String getProfileUrl = "$baseUrl/auth/profileData?userCode=";
  static const String logouturl = "$baseUrl/logoutapi";
  static const String findvendors = "$baseUrl/api/findallvendor";
  static const String findKishaan = "$baseUrl/api/findAllKisan";
  static const String findDrivers = "$baseUrl/api/findDriverDetails";
  static const String findCrops = "$baseUrl/api/findAllVegatable";
  static const String findProfile = "$baseUrl/auth/findprofile";
  static const String getDriverRecordsCount =
      '$baseUrl/api/getDriverCountByUserCode?userCode=';
  static const String getFarmerRecordsCount =
      '$baseUrl/api/getfarmerCountByUserCode?userCode=';
  static const String getVendorRecordsCount =
      '$baseUrl/api/getvendorCountByUserCode?userCode=';
  static const String getCropRecordsCount =
      '$baseUrl/api/getVegCountByUserCode?userCode=';
}
