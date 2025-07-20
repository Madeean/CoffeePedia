import 'package:technical_test/domain/coffee/model/CoffeeDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';


abstract class CoffeeUseCase {
  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeHot();

  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeIce();
}
