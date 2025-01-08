import 'dart:async';
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/models/city_weather_model.dart';


class LocalDatabaseHelper {
  static Database? _database;
  static const String _tableName = 'citiesWeather';

  static Future<void> initDatabase() async {
    String path = await getDatabasesPath();
    _database = await openDatabase(
      join(path, 'citiesWeather.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $_tableName(
            id TEXT,
            city_name TEXT,
            weather_condition TEXT,
            temp TEXT,
            humidity TEXT,
            wind_speed TEXT


          )
          ''',
        ).then((value) {
          log("created succeefully");
        }).catchError((err) {
          log("error create");
          log(err.toString());
        });
      },
      onOpen: (db) {
        log("DB is opened");
      },
      version: 1,
    );
  }

  static Future<void> insertCityWeather({
    required String city_name,
    required String temp,
    required String weather_condition,
    required String humidity,
    required String wind_speed,
    required String id,
  }) async {
    final Database? db = await _database;
    await db!.transaction((txn) async {
      var batch = txn.batch();

      /*
      CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            city_name TEXT,
            weather_condition TEXT,
            temp TEXT,
            humidity TEXT,
            wind_speed TEXT
       */
      batch.insert(_tableName, {
        "id": id,
        "city_name": city_name,
        "weather_condition": weather_condition,
        "temp": temp,
        "humidity": humidity,
        "wind_speed": wind_speed,
      });
      await batch.commit();
    }).then((value) {
      log("innserted succeessfully");
    }).catchError((err) {
      log(
        err.toString(),
      );
    });
  }

  static Future<List<CityWeatherModel?>> getAllCitiesWeather() async {
    final Database? db = await _database;
    final List<Map<String, dynamic>> maps = await db!
        .query(
      _tableName,
    )
        .then((value) {
      return value;
    }).catchError((err) {
      log(err.toString());
      return err;
    });
    return List.generate(maps.length, (i) {
      return CityWeatherModel.fromJsonFromLocalDB(maps[i]);
    });
  }


  static Future<void> deleteCityById(String id) async {
    final Database? db = await _database;

    if (db == null) {
      log("Database is not initialized.");
      return;
    }

    try {
      int count = await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count > 0) {
        log("City with ID $id deleted successfully.");
      } else {
        log("No city found with ID $id.");
      }
    } catch (err) {
      log("Error deleting city: ${err.toString()}");
    }
  }

}
