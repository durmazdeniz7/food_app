import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum KullaniciDurumu { OturumAcilmis, OturumAcilmamis, OturumAciliyor }

class AuthService2 with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  KullaniciDurumu _kullaniciDurumu = KullaniciDurumu.OturumAcilmamis;

  KullaniciDurumu get getKullaniciDurumu => _kullaniciDurumu;

  User? get getUser => _user;

  set setKullaniciDurumu(KullaniciDurumu kullaniciDurumu) {
    _kullaniciDurumu = kullaniciDurumu;
    notifyListeners();
  }

  AuthService2() {
    _firebaseAuth.authStateChanges().listen(_authStateChange);
  }

  void _authStateChange(User? event) {
    if (event == null) {
      _user = null;
      setKullaniciDurumu = KullaniciDurumu.OturumAcilmamis;
    } else {
      setKullaniciDurumu = KullaniciDurumu.OturumAcilmis;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      setKullaniciDurumu = KullaniciDurumu.OturumAciliyor;
      UserCredential userCreditinal = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User _newUser = userCreditinal.user!;
      _user = _newUser;
      return _newUser;
    } catch (e) {
      setKullaniciDurumu = KullaniciDurumu.OturumAcilmamis;

      debugPrint("Kayıt olda Hata çıktı hata kodu $e ");
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      setKullaniciDurumu = KullaniciDurumu.OturumAciliyor;
      UserCredential userCreditinal = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User _oturumAcanKullanici = userCreditinal.user!;
      _user = _oturumAcanKullanici;
      return _oturumAcanKullanici;
    } catch (e) {
      setKullaniciDurumu = KullaniciDurumu.OturumAcilmamis;

      debugPrint("Sign in de Hata çıktı hata kodu $e ");
      return null;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
    Future<bool> signOut() async {
      try {
        await _firebaseAuth.signOut();
        setKullaniciDurumu = KullaniciDurumu.OturumAcilmamis;
        _user = null;
        return true;
      } catch (e) {
        debugPrint("Sign Outta Hata Çıktı $e");
        return false;
      }
    }
  }
