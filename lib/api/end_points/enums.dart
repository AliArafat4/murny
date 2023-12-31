enum Auth {
  userSignUp,
  driverSignUp,
  signInWithApple,
  signInWithGoogle,
  otp,
  signIn,
  resendOtp
}

enum Chat { getMessages, sendMessages }

enum Common { getDriverOrder, getUserOrder, getDrivers, filterDrivers }

enum Driver { responseToOrder, getRating }

enum Profile {
  updateUserProfile,
  updateDriverProfile,
  uploadAvatar,
  uploadDriverLicense,
  getProfile,
  deleteUserAccount
}

enum Public { getCarts }

enum User { postRating, postUserOrder }
