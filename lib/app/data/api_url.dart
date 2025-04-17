abstract class ApiUrl {
  static var baseUrl = "10.0.2.2";
  static var url = "http://$baseUrl:2008";
  static var urlPostLogin = "$url/auth/user/login";
  static var urlPostLogout = "$url/auth/logout";
  static var urlGetUser = "$url/user/";
  static var urlGetUserBooking = "$url/user/booking";
  static var urlGetAllPackage = "$url/user/package";
  static var urlGetPackageBookingById = "$url/user/booking";
  static var urlGetBookingPrice = "$url/user/package/price/";
  static var urlGetUserPackageRombongan = "$url/user/package/rombongan";
  static var urlGetPackageRating = "$url/user/package/rating";
  static var urlPostBookingPackage = "$url/user/booking";
  static var urlPostNewMessage = "$url/chat/message";
  static var urlGetAllMessage = "$url/chat/message";
  static var urlPostPackageeMessage = "$url/chat/start_chat";
  static var urlGetChatList = "$url/chat/room";
  static var urlGetReadChatAdmin = "$url/chat/message/read/";
  
}

// pas dapat messagenya tinggal dipush aja dilist message nbarunya, atau kalau mau gampang fecth ulang dia getAllMessagenya. tapi lebih baik push message ke list.