import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magbagbe_app/models/reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReminderManager {
  static const _key = 'reminders';

  static Future<void> saveReminders(List<Reminder> reminders) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> remindersJson = reminders.map((reminder) => reminder.toJson()).cast<String>().toList();
    prefs.setStringList(_key, remindersJson);
  }

  static Future<List<Reminder>> loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> remindersJson = prefs.getStringList(_key) ?? [];
    return remindersJson.map((json) => Reminder.fromJson(jsonDecode(json))).toList();
  }
}
