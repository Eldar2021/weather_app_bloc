import 'package:flutter/material.dart';
import '/data/kg_region/region_model.dart';

class RegionCard extends StatelessWidget {
  const RegionCard({
    Key? key,
    required this.region,
  }) : super(key: key);

  final RegionModel region;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xff000000),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffFFFFFF),
        ),
      ),
      child: Column(
        children: [
          Text(region.kgName),
          const SizedBox(height: 10),
          Text(region.enName),
        ],
      ),
    );
  }
}