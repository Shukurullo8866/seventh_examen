

class ColorModel {
  String colorA;
  String colorB;

  ColorModel({required this.colorA, required this.colorB});

  static List<ColorModel> colors = [
    ColorModel(colorA: "0xff5646a3", colorB: "0xff44336"),
    ColorModel(colorA: "0xff2196f3", colorB: "0xff4caf50"),
    ColorModel(colorA: "0xff4caf50", colorB: "0xffffeb3b"),
  ];
}