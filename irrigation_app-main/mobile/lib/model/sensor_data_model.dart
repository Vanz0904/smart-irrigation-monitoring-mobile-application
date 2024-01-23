import 'dart:convert';

List<SensorData> sensorDataFromJson(String str) => List<SensorData>.from(json.decode(str).map((x) => SensorData.fromJson(x)));

String sensorDataToJson(List<SensorData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SensorData {
    String id;
    SensorType sensorType;
    String sensorValue;
    DateTime timestamp;

    SensorData({
        required this.id,
        required this.sensorType,
        required this.sensorValue,
        required this.timestamp,
    });

    factory SensorData.fromJson(Map<String, dynamic> json) => SensorData(
        id: json["ID"],
        sensorType: sensorTypeValues.map[json["SensorType"]]!,
        sensorValue: json["SensorValue"],
        timestamp: DateTime.parse(json["Timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "SensorType": sensorTypeValues.reverse[sensorType],
        "SensorValue": sensorValue,
        "Timestamp": timestamp.toIso8601String(),
    };
}

enum SensorType {
    HUMIDITY,
    MOISTURE,
    TEMPERATURE,
    WATER_LEVEL
}

final sensorTypeValues = EnumValues({
    "Humidity": SensorType.HUMIDITY,
    "Moisture": SensorType.MOISTURE,
    "Temperature": SensorType.TEMPERATURE,
    "WaterLevel": SensorType.WATER_LEVEL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
