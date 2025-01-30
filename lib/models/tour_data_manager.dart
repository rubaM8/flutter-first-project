import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ToursModel extends ChangeNotifier {
  final String dateRange;
  final String tourAbout;
  final String location;
  final String remarks;

  ToursModel({
    required this.dateRange,
    required this.tourAbout,
    required this.location,
    required this.remarks,
  });

  Map<String, dynamic> toJson() => {
        'dateRange': dateRange,
        'tourAbout': tourAbout,
        'location': location,
        'remarks': remarks,
      };

  factory ToursModel.fromJson(Map<String, dynamic> json) => ToursModel(
        dateRange: json['dateRange'],
        tourAbout: json['tourAbout'],
        location: json['location'],
        remarks: json['remarks'],
      );

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/tours.json');
  }

  Future<File> get _stringFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/myName.txt');
  }

  Future<void> saveTours(List<ToursModel> tours) async {
    final file = await _localFile;
    final jsonString = jsonEncode(tours.map((q) => q.toJson()).toList());
    await file.writeAsString(jsonString);
  }

  Future<void> loadTours() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final jsonList = jsonDecode(jsonString) as List;

        tourData = jsonList.map((json) => ToursModel.fromJson(json)).toList();
      } else {
        tourData = [];
      }
    } catch (e) {
      print('Error loading tours: $e');
      tourData = [];
    } finally {
      notifyListeners();
    }
  }

  Future<void> saveString(String myString) async {
    final file = await _stringFile;
    await file.writeAsString(myString);
  }

  Future<String?> loadString() async {
    try {
      final file = await _stringFile;
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return "user!";
      }
    } catch (e) {
      print('Error loading string: $e');
      return null;
    }
  }

  void addTour(ToursModel tour) {
    tourData.add(tour);
    saveTours(tourData);
    notifyListeners();
  }

  void removeTour(ToursModel tour) {
    tourData.remove(tour);
    saveTours(tourData);
    notifyListeners();
  }
}

List<ToursModel> tourData = [
  ToursModel(
    dateRange: "2025 Jun 5 - 2025 Oct 20",
    tourAbout: "Volunteering",
    location: "Syria",
    remarks: "check for visa necessity!",
  ),
  ToursModel(
    dateRange: "2023 Feb 3 - 2023 Feb 4",
    tourAbout: "Transit",
    location: "Jordan",
    remarks: "hope it goes easy..",
  ),
];
