import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? increaseIndex(int? currentQuestion) {
  // increase the current question integer by 1
  return currentQuestion != null ? currentQuestion + 1 : null;
}

int? increaseCorrect(int? numCorrect) {
  return numCorrect != null ? numCorrect + 1 : null;
}

int daysBetween(
  DateTime from,
  DateTime to,
) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

int increaseStreak(int streak) {
  return streak + 1;
}

double calculatePercentCorrect(
  int numQues,
  int numCorrect,
) {
  return numCorrect / numQues;
}
