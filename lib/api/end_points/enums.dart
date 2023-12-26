enum Auth {
  userSignUp,
  driverSignUp,
  signInWithApple,
  signInWithGoogle,
  otp,
  signIn
}

enum Chat { getMessages, sendMessages }

enum Common { getOrder, getDrivers }

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
