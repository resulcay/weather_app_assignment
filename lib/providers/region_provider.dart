import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_assignment/models/region_model.dart';

class RegionProvider extends StateNotifier<List<RegionModel>> {
  RegionProvider() : super([]);

  getAllRegions(List<RegionModel>? models) {
    if (models != null) {
      state = models;
    }
  }
}
