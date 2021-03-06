abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsAppChangeModeState extends NewsStates{}

class NewsAppLanguageState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSeaechSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}


class NewsGetMoreLoadingState extends NewsStates{}

class NewsGetMoreSuccessState extends NewsStates{}

class NewsGetMoreErrorState extends NewsStates{
  final String error;
  NewsGetMoreErrorState(this.error);
}