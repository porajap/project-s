class AppUrl{
  static final String devUrl = "http://192.168.1.107:4000/api";
  static final String productionUrl = "https://re-loader.com/api_smarthospital/app/api";

  static final String baseUrl = devUrl;

  //auth
  static final String checkPhone = "$baseUrl/auth/check-phone";
  static final String createPassword = "$baseUrl/auth/create-password";
  static final String login = "$baseUrl/auth/login";

  //get queue
  static final String scanQr = "$baseUrl/queue/scan-qr";
  static final String updateHN = "$baseUrl/queue/update-hn";
  static final String registerAt = "$baseUrl/queue/register-at";
  static final String confirmQ = "$baseUrl/queue/confirm-queue";
  static final String qToday = "$baseUrl/queue/queue-today";

}