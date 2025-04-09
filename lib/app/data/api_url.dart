abstract class ApiUrl {
  static var baseUrl = "10.0.2.2";
  static var url = "http://$baseUrl:2008";
  static var urlPostLogin = "$url/auth/user/login";
  static var urlPostLogout = "$url/auth/logout";
  static var urlGetUser = "$url/user";
  static var urlGetUserBooking = "$url/user/booking";
  static var urlGetAllPackage = "$url/user/package";
  static var urlGetUserPackageRombongan = "$url/user/package/rombongan";
  
}