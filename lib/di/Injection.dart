import 'package:get_it/get_it.dart';
import 'package:technical_test/data/repository/CoffeeRepositoryImpl.dart';
import 'package:technical_test/domain/CoffeeRepository.dart';
import 'package:technical_test/domain/CoffeeUseCase.dart';
import 'package:technical_test/domain/CoffeeUseCaseImpl.dart';

import '../data/network/Network.dart';
import '../presentation/pages/Coffee/globalBloc/coffee_bloc.dart';

final sl = GetIt.instance;

void setupDI() {
  sl.registerLazySingleton(() => Network());

  // Repository
  sl.registerLazySingleton<CoffeeRepository>(() => CoffeeRepositoryImpl(sl()));

  // UseCase
  sl.registerLazySingleton<CoffeeUseCase>(
    () => CoffeeUseCaseImpl(sl<CoffeeRepository>()),
  );
}
