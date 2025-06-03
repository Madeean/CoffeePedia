import 'package:technical_test/domain/model/CoffeeDomainModel.dart';

import '../utils/RequestState.dart';

abstract class CoffeeUseCase {
  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeHot();

  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeIce();
}
