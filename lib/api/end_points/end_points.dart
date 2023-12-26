abstract mixin class AuthApiEndPoints {
  final authRoute = "/auth";
  final userSignUp = "/user_sign_up";
  final driverSignUp = "/driver_sign_up";
  final signInWithApple = "/sign_in_with_apple";
  final signInWithGoogle = "/sign_in_with_google";
  final otp = "/otp";
  final signIn = "/sign_in";
}

abstract mixin class UserApiEndPoints {
  final userRoute = "/user";
  final postRating = "/post_rating";
  final postUserOrder = "/post_user_order";
}

abstract mixin class DriverApiEndPoints {
  final driverRoute = "/driver";
  final responseToOrder = "/response_to_order";
  final getRating = "/get_rating";
}

abstract mixin class CommonApiEndPoints {
  final commonRoute = "/common";
  final getOrder = "/get_order";
  final getDrivers = "/get_drivers";
}

abstract mixin class ChatApiEndPoints {
  final chatRoute = "/chat";
  final sendMessages = "/send_message";
  final getMessages = "/get_message";
}

abstract mixin class ProfileApiEndPoints {
  final profileRoute = "/profile";
  final updateUserProfile = "/update_user_profile";
  final updateDriverProfile = "/update_driver_profile";
  final uploadAvatar = "/upload_avatar";
  final uploadDriverLicense = "/upload_driver_license";
  final getProfile = "/get_profile";
  final deleteAccount = "/delete_user_account";
}

abstract mixin class PublicApiEndPoints {
  final publicRoute = "/public";
  final getCarts = "/get_carts";
}

class EndPoints extends AuthApiEndPoints
    with
        UserApiEndPoints,
        DriverApiEndPoints,
        CommonApiEndPoints,
        ChatApiEndPoints,
        ProfileApiEndPoints,
        PublicApiEndPoints {}
