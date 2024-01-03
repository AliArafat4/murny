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

enum Common {
  getDriverOrder,
  getUserOrder,
  getDrivers,
  filterDrivers,
  getLastUserOrder
}

enum Driver { responseToOrder, getRating, getDriverByID }

enum Profile {
  updateUserProfile,
  updateDriverProfile,
  uploadAvatar,
  uploadDriverLicense,
  getProfile,
  deleteUserAccount
}

enum Public { getCarts, getCartByID }

enum User { postRating, postUserOrder, getUserByID, cancelOrder }
