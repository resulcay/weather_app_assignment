import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_assignment/providers/loading_indicator_provider.dart';
import '../models/region_model.dart';

abstract class IRegionService extends LoadingIndicatorProvider {
  IRegionService(this.dio);
  final Dio dio;

  Future<List<RegionModel>?> fetchRegions(BuildContext context, String filter);
}

class RegionService extends IRegionService {
  RegionService(super.dio);

  bool loading = false;
  @override
  Future<List<RegionModel>?> fetchRegions(
    BuildContext? context,
    String filter,
  ) async {
    state = true;
    final response = await dio.get(filter);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        state = false;
        List<RegionModel> value =
            jsonBody.map((e) => RegionModel.fromMap(e)).toList();

        return value;
      }
    }
    return null;
  }
}
