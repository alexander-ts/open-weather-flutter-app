double convertToCelsius(double temp) {
  return (temp - 273.15).roundToDouble();
}

String getCardinalDirection(double angle) {
  const directions = [
    'северный',
    'северно-восточный',
    'восточный',
    'юго-восточный',
    'южный',
    'юго-западный',
    'западный',
    'северо-западный'
  ];
  return directions[(angle / 45).round() % 8];
}

String getHumidityDescription(double humidity) {
  if (humidity < 60) return 'Низкая';
  if (humidity > 80) return 'Высокая';
  return 'Средняя';
}
