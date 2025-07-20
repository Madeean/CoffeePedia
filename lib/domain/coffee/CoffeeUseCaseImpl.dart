import 'package:technical_test/domain/coffee/CoffeeRepository.dart';
import 'package:technical_test/domain/coffee/CoffeeUseCase.dart';
import 'package:technical_test/domain/coffee/model/CoffeeDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

class CoffeeUseCaseImpl implements CoffeeUseCase {
  final CoffeeRepository repository;

  CoffeeUseCaseImpl(this.repository);

  @override
  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeHot() {
    return repository.getAllCoffeeHot();
  }

  @override
  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeIce() {
    return repository.getAllCoffeeIce();
  }
}
