class SocialInputRequest {
  final String providerId;
  final String tokenLoginSocial;
  final String reActivateIt;

  SocialInputRequest({
    required this.providerId,
    required this.tokenLoginSocial,
    this.reActivateIt = "0",
  });

  Map<String, dynamic> toJson() {
    return {
      "ProviderID": providerId,
      "TokenLoginSocial": tokenLoginSocial,
      "ReActiveit": reActivateIt,
    };
  }
}
