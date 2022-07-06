import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  void updateDashboardCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  void toggleIsAdmin() {
    _isAdmin = !_isAdmin;
    notifyListeners();
  }

  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void toggleIsLogin() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  /// Authentication
  Future<UserCredential?> signIn() async {
    final _mobNo = phoneController.text.trim();
    await _auth.signInWithPhoneNumber(_mobNo);
  }

  String? _verificationID;
  String? get verificationID => _verificationID;
  void setVerificationID(String? vid) {
    _verificationID = vid;
    notifyListeners();
  }

  Future<UserCredential?> registerUser() async {}
}
