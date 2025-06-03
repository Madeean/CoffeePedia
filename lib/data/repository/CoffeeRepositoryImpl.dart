import 'package:technical_test/data/network/Network.dart';
import 'package:technical_test/data/utils/DataUtils.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

import '../../domain/CoffeeRepository.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final Network network;

  CoffeeRepositoryImpl(this.network);

  @override
  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeHot() async {
    return getCoffeeList('hot', network);
  }

  @override
  Future<RequestState<List<CoffeeDomainModel>>> getAllCoffeeIce() async {
    return getCoffeeList('iced', network);
  }
}
