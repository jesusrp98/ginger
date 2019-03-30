/// GINGER ITEM CLASS
/// This abstract class is the superclass of both recipes & cocktails.
/// It helps handeling both clases using one view & logic.
abstract class GingerItem {
  final String name, photo;

  GingerItem({this.name, this.photo});

  String get subtitle;
}
