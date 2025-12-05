import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences extends ChangeNotifier {
  String _ageGroup = '30s';  // 기본값: 30대
  
  String get ageGroup => _ageGroup;
  
  String get ageGroupDisplay {
    switch (_ageGroup) {
      case '20s':
        return '20대';
      case '30s':
        return '30대';
      case '40s':
        return '40대';
      case '50s':
        return '50대';
      default:
        return '30대';
    }
  }

  UserPreferences() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _ageGroup = prefs.getString('age_group') ?? '30s';
    notifyListeners();
  }

  Future<void> setAgeGroup(String ageGroup) async {
    _ageGroup = ageGroup;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('age_group', ageGroup);
    notifyListeners();
  }
}
