import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(Welcome());
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BodyWidget(),

    ),
      );
  }
}
class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child:
      Text(
        "Recycling is an imperative practice in our modern society, especially when it comes to materials such as paper, wood, steel, and others. The need to recycle these wastes arises from multiple crucial reasons. Firstly, recycling helps to conserve valuable natural resources. By reusing materials like paper and wood, we reduce the demand for fresh resources, thereby minimizing deforestation and habitat destruction. Similarly, recycling steel reduces the need for mining iron ore, saving energy and preserving natural landscapes."
        "Secondly, recycling reduces the strain on landfill capacity. Discarded materials take up significant space in landfills, which are already facing limited availability. Recycling helps divert these items from landfills, freeing up valuable land for other purposes and preventing pollution of soil and groundwater."
        "Furthermore, recycling plays a vital role in reducing energy consumption and greenhouse gas emissions. Processing recycled materials generally requires less energy than producing new materials from scratch. For instance, recycling paper saves trees and uses less energy than manufacturing paper from virgin pulp. Recycling steel requires significantly less energy compared to extracting and refining raw iron ore. These energy savings contribute to the overall reduction in greenhouse gas emissions, mitigating the impact of climate change."
        "In conclusion, recycling our waste materials like paper, wood, steel, and others is not just a responsible choice but a necessity. It helps conserve natural resources, alleviate pressure on landfills, and reduce energy consumption and greenhouse gas emissions. Embracing recycling as a societal norm is vital for the sustainable future of our planet.",
        textAlign: TextAlign.start,
        overflow: TextOverflow.visible,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    );
  }
}

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Image.asset('assets/images/png-clipart-recycle-logo-paper-recycling-symbol-recycling-bin-recycle-miscellaneous-angle-thumbnail.png'),

      ),
    );
  }
}

class Images1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child:
        Image.asset('assets/images/png-clipart-recycle-logo-paper-recycling-symbol-recycling-bin-recycle-miscellaneous-angle-thumbnail.png')
    );
  }
}