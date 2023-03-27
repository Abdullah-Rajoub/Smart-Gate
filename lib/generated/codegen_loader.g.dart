// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "email": "البريد الإكتروني",
  "password": "كلمة السر",
  "remember_me": "احفظ معلومات تسجيل الدخول",
  "login": "تسجيل الدخول",
  "start_date": "من",
  "end_date": "إلى",
  "employee_name": "اسم الموظف",
  "license_confidence": "الثقة في لوحة السيارة",
  "modal_confidence": "الثقة في طراز السيارة",
  "parking": "موقف سيارات",
  "time": "الوقت",
  "building105": "مبنى 105",
  "building103": "مبنى 103",
  "building102": "مبنى 102",
  "building101": "مبنى 101",
  "log_search_label": "بحث",
  "authorized": "مصرح له",
  "unauthorized": "غير مصرح له",
  "building104": "مبنى 104",
  "zero": "٠",
  "nine": "٩",
  "eight": "٨",
  "seven": "٧",
  "six": "٦",
  "five": "٥",
  "four": "٤",
  "three": "٣",
  "two": "٢",
  "one": "١",
  "None": "لا يوجد",
  "delete_warning_title": "هل تريد مسح السجل؟ ",
  "delete_warning_comment_beginning": "السجل التابع للوحة السايرة الآتية ",
  "delete_warning_comment_end": "سيتم مسحة. الرجاء التأكد من صحة العملية",
  "delete_warning_deleteButton": "حذف",
  "delete_warning_deleteCancel": "الغاء الأمر"
};
static const Map<String,dynamic> en = {
  "email": "Email",
  "password": "Password",
  "remember_me": "Remember me",
  "login": "LOGIN",
  "start_date": "From",
  "end_date": "To",
  "employee_name": "Employee Name",
  "license_confidence": "License Confidence",
  "modal_confidence": "Modal Confidence",
  "parking": "Parking",
  "time": "Time",
  "building105": "Building105",
  "building103": "Building103",
  "building102": "Building102",
  "building101": "Building101",
  "log_search_label": "Search",
  "authorized": "Authorized",
  "unauthorized": "Unauthorized",
  "building104": "Building104",
  "zero": "0",
  "nine": "9",
  "eight": "8",
  "seven": "7",
  "six": "6",
  "five": "5",
  "four": "4",
  "three": "3",
  "two": "2",
  "one": "1",
  "None": "NONE",
  "delete_warning_title": "Do you want to delete this record?",
  "delete_warning_comment_beginning": "The record belonging to car",
  "delete_warning_comment_end": "will be deleted. This will not effect any other record belonging to the same car, but it will delete the record selected.",
  "delete_warning_deleteButton": "DELETE",
  "delete_warning_deleteCancel": "CANCEL"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
