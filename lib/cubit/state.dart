abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewBottomNavState extends NewsState {}

class NewsGetBussinusLoadingState extends NewsState {}

class NewsGetBussinusSuccessState extends NewsState {}

class NewsGetBussinusErorrState extends NewsState {
  final String erorr;
  NewsGetBussinusErorrState(this.erorr);
}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsErorrState extends NewsState {
  final String erorr;
  NewsGetSportsErorrState(this.erorr);
}

class NewsGetscienceLoadingState extends NewsState {}

class NewsGetscienceSuccessState extends NewsState {}

class NewsGetscienceErorrState extends NewsState {
  final String erorr;
  NewsGetscienceErorrState(this.erorr);
}

class NewsGettechnologyLoadingState extends NewsState {}

class NewsGettechnologySuccessState extends NewsState {}

class NewsGettechnologyErorrState extends NewsState {
  final String erorr;
  NewsGettechnologyErorrState(this.erorr);
}

class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchErorrState extends NewsState {
  final String erorr;
  NewsGetSearchErorrState(this.erorr);
}

class NewDarkModeState extends NewsState {}
