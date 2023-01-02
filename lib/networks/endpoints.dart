// ignore_for_file: constant_identifier_names
//live url
//const String url = "";
//test local
//const String url = "http://127.0.0.1:3040";
//staging
const String url = "https://api.codemen.org";

class NetworkConstants {
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiZWJ1eS1hbmRyb2lkLWFwcHMiLCJpYXQiOjE1NzIzNzI3Nzh9.X1qxpv6WDUP";
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

class PaymentGateway {
  static String gateway(String orderId) =>
      "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
}

class Endpoints {
  static String postlogin() => "/api/v1/login";
  static String getNoticeList() => "/api/v1/notices";
  static String getNoticeDetail(String id) => "/api/v1/notice/$id";
  static String getLeaveType() => "/api/v1/leave-types";
  static String postLeaveReq() => "/api/v1/leave-request/create";
  static String getLeaveReqList() => "/api/v1/leave-requests";
  static String getProfile(String id) => "/api/v1/user/$id";
  static String postDeviceToken() => "/api/v1/register/device";
  static String getEmployee(String userId) => "/api/v1/employee/$userId";
  static String getDBLeaveInfo() => "/api/v1/leave-request/count/employee";
  static String getLeaveDetailByID(String leaveId) =>
      "/api/v1/leave-request/$leaveId";

  static String postSignUp() => "/api/signup";
  static String postVerify() => "/api/verify-code";
  static String getLogout() => "/api/logout";
  static String getSlider() => "/api/sliders";
  static String getShopProductCategory() => "/api/product-categories";
  static String getShopProducts() => "/api/products";
  static String postForgotPassword() => "/api/forgot-password";
  static String postResetPassword() => "/api/reset-password";
  static String getProductDetail(String slug) => "/api/products/$slug";
  static String getAllProductsByCategory(String slug) =>
      "/api/product-categories/$slug/products";
  static String postCart() => "/api/carts";
  static String postSaveAddress() => "/api/save-delivery-address";
  static String postUpdateAddress() => "/api/save-delivery-address";
  static String getDeliveryAddress() => "/api/delivery-addresses";
  static String getSingleDeliveryAddress(int id) => "/api/delivery-address/$id";
  static String DeleteDeliveryAddress(int id) => "/api/delivery-addresses/$id";
  static String getTimeSlot() => "/api/time-slots";
  static String getProfleData() => "/api/profile";
  static String postUpdatePhone() => "/api/update-profile";
  static String postCreateOrder() => "/api/orders";
  static String getDefaultDelivaryAddress() => "/api/delivery-addresses";
  static String deleteAccount() => "/api/delete-account";
  static String resetPassword() => "/api/change-password";
  static String getOrderList() => "/api/orders";
  static String getOrderDetail(String orderID) => "/api/orders/$orderID";

  static String deleteDeviceToken() => "/api/delete-device-token";
}
