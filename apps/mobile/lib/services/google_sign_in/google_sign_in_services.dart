import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/utils/core/environment.dart';

final googleSignInServiceProvider = Provider<GoogleSignInServices>(
  (ref) => GoogleSignInServices(),
);

class GoogleSignInServices {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final List<String> _scopes = [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
    'openid',
  ];

  GoogleSignInServices() {
    _googleSignIn.initialize(
      clientId: Environment.googleClientId,
      serverClientId: Environment.googleServerClientId,
    );
  }

  Future<String?> signIn() async {
    try {
      final gUser = await _googleSignIn.authenticate(scopeHint: _scopes);
      final authentication = gUser.authentication;
      return authentication.idToken;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
