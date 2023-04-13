import 'package:flutter/material.dart';
import 'package:weather_app_assignment/extensions/padding_extension.dart';
import '../constants/constant_color.dart';

class WeatherCard extends StatelessWidget {
  final String region;
  final String capital;
  final String temperature;
  const WeatherCard({
    Key? key,
    required this.region,
    required this.capital,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: context.paddingOnlyNormal,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: ConstantColor.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ConstantColor.borderColor.withOpacity(0.06),
              spreadRadius: 6,
              offset: const Offset(6, 6),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: context.paddingNormalized,
            child: Row(
              children: [
                Image.asset('assets/images/location-blue.png'),
                Padding(
                  padding: context.paddingNormal,
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      region,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ConstantColor.textColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: context.paddingNormal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/cloud.png'),
                Text(
                  capital,
                  style: const TextStyle(
                    color: ConstantColor.tagColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$temperature degrees',
                  style: const TextStyle(
                    color: ConstantColor.subTagColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
