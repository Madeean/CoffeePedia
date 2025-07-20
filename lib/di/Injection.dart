import 'package:get_it/get_it.dart';
import 'package:technical_test/data/repository/CoffeeRepositoryImpl.dart';
import 'package:technical_test/data/repository/favorite/FavoriteRepositoryImpl.dart';
import 'package:technical_test/domain/coffee/CoffeeRepository.dart';
import 'package:technical_test/domain/coffee/CoffeeUseCase.dart';
import 'package:technical_test/domain/coffee/CoffeeUseCaseImpl.dart';
import 'package:technical_test/domain/favorite/FavoriteRepository.dart';
import 'package:technical_test/domain/favorite/FavoriteUseCase.dart';
import 'package:technical_test/domain/favorite/FavoriteUseCaseImpl.dart';

import '../data/network/Network.dart';

final sl = GetIt.instance;

void setupDI() {
  sl.registerLazySingleton(() => Network());

  // Repository
  sl.registerLazySingleton<CoffeeRepository>(() => CoffeeRepositoryImpl(sl()));
  sl.registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImpl());

  // UseCase
  sl.registerLazySingleton<CoffeeUseCase>(
    () => CoffeeUseCaseImpl(sl<CoffeeRepository>()),
  );
  sl.registerLazySingleton<FavoriteUseCase>(
    () => FavoriteUseCaseImpl(sl<FavoriteRepository>()),
  );
}
