import 'package:technical_test/domain/CoffeeRepository.dart';
import 'package:technical_test/domain/CoffeeUseCase.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
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
