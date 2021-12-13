import 'package:flutter/material.dart';
import '/data/kg_region/region_model.dart';
import '/presentation/components/region_card.dart';

class RegionListBuilder extends StatelessWidget {
  const RegionListBuilder({
    Key? key,
    required this.list,
    required this.selected,
  }) : super(key: key);

  final List<RegionModel> list;
  final Function selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          RegionModel region = list[index];
          return InkWell(
            onTap: () {
              selected(region);
            },
            child: RegionCard(region: region),
          );
        },
      ),
    );
  }
}
