import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState? _instance;
  static FFAppState get instance => _instance ??= FFAppState._();

  FFAppState._();

  // Global switch value for theme
  static bool globalSwitchValue = false;

  // Initialize persisted state
  Future<void> initializePersistedState() async {
    final prefs = await SharedPreferences.getInstance();
    globalSwitchValue = prefs.getBool('globalSwitchValue') ?? false;
  }

  // Save state to preferences
  Future<void> saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('globalSwitchValue', globalSwitchValue);
  }

  // Update global switch value
  void updateGlobalSwitchValue(bool value) {
    globalSwitchValue = value;
    saveState();
    notifyListeners();
  }
}
