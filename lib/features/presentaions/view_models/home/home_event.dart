sealed class HomeEvent {}
sealed class HomeUiEvent {}

//******************** Home Events
class GetProductsByCategoryIdEvent extends HomeEvent {
  String categoryId;

  GetProductsByCategoryIdEvent(this.categoryId);
}
class GetCategoriesEvent extends HomeEvent {}
class GetBannersEvent extends HomeEvent {}

class GetHomeDataEvent extends HomeEvent {
  GetProductsByCategoryIdEvent productEvent;

  GetHomeDataEvent(this.productEvent);
}

//******************** Home Ui Events
class ShowMessageEvent extends HomeUiEvent {
  String message;
  ShowMessageEvent(this.message);
}