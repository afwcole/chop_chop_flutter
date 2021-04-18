class UserAccount {
  final String uid, email, phoneNumber, displayName;
  final bool emailVerified;

  UserAccount({
    this.uid,
    this.email,
    this.phoneNumber,
    this.displayName,
    this.emailVerified,
  });
}