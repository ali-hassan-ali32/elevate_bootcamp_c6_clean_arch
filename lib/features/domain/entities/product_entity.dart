class ProductEntity {
  List<String> images;
  num ratingsQuantity;
  String title;
  String slug;

  ProductEntity({
    required this.title,
    required this.images,
    required this.slug,
    required this.ratingsQuantity
  });
}