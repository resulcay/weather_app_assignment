import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_assignment/extensions/media_query_extension.dart';
import 'package:weather_app_assignment/extensions/padding_extension.dart';
import 'package:weather_app_assignment/main.dart';

import '../components/weather_card.dart';
import '../services/dio_service.dart';
import '../services/network_service.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen>
    with CustomDioMixin {
  late final IRegionService regionInstance;

  @override
  void initState() {
    super.initState();

    regionInstance = RegionService(capitalService);
    regionInstance.fetchRegions(context, 'all').then((value) {
      return ref.read(regionProvider.notifier).getAllRegions(value);
    });
  }

  search(String filterController) {
    filterController = filterController.trim();
    if (filterController.isEmpty) {
      filterController = 'all';
    }

    regionInstance.fetchRegions(context, filterController).then((value) {
      return ref.read(regionProvider.notifier).getAllRegions(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final regionModels = ref.watch(regionProvider);
    final indicator = ref.watch(completedIndProvider);
    TextEditingController filterController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingLow,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  textInputAction: TextInputAction.done,
                  controller: filterController,
                  decoration: InputDecoration(
                    hintText: 'Search country capitals by region',
                    contentPadding: context.paddingNormal,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          search(filterController.text);
                        },
                        child: Image.asset('assets/images/search.png')),
                  ),
                ),
                Builder(builder: (context) {
                  if (indicator) {
                    return SizedBox(
                      height: context.height * .85,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Column(
                      children: List.generate(
                        regionModels.length,
                        (index) => WeatherCard(
                          region:
                              '${regionModels[index].region}, ${regionModels[index].name.common}',
                          capital: regionModels[index].capital[0],
                          temperature: '25',
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
