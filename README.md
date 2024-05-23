# TecnoFit Challenge App

## Running Locally
To run this project locally you must have Flutter 3.22.0.

## Packages

```yaml
dependencies:
  reqres_api_client:
    path: packages/reqres_api_client
  cupertino_icons: ^1.0.2
  get_it: ^7.7.0
  equatable: ^2.0.5
  bloc: ^8.1.4
  flutter_bloc: ^8.1.5
  mockito: ^5.4.4
  flutter_svg: ^2.0.10+1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  build_runner: ^2.4.10
  bloc_test: ^9.1.7
```

## Getting around

### ReqRes API Client
```
packages/reqres_api_client
```
This is a custom made package just to access the ReqRes API. It was made with the objective to demonstrante a different architecture approach. It has its own README, so feel free to read it.

### State Management Approach
The projects uses BLoC for state management. I chose it because I believe it is more future-proof for bigger applications (which is not the case here), keeping the reactivity event-driven and the bussiness logic away from the presentation layer.

### Pages
The application has three simple pages: login, tweets, and contact. All the user data is fetched from the API, as requested, and all the screens are responsiveness (tested on iOS, Android, and Web).

### AI
AI was used in this project to generate the fake content (tweets and bio) available throughout the app.
Copilot was used solely for auto-complete - because I already have it integrate on my IDE and speeds up the development process of not so important things, like toJson()/fromJson() methods.


### Final Considerations
This project has no data persitence.