# open_weather_flutter_app

A demo Flutter app that shows the current weather for the user’s location.

![sign-in-screen.jpg](assets%2Fscreenshots%2Fsign-in-screen.jpg)
![weather-screen.jpg](assets%2Fscreenshots%2Fweather-screen.jpg)

## Build

1. Add Firebase configuration:
```shell
flutterfire configure
```
2. Add .env file with API_KEY to the project's root:

```text
API_KEY=your_open_weather_api_key
API_PATH=https://api.openweathermap.org/data/2.5
```

## TODOs

### Authentication
- validate email address
- ui divider border radius

### Weather
- move location logic outside a cubit