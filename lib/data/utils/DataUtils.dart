import 'package:technical_test/data/network/Network.dart';
import 'package:technical_test/data/repository/model/CoffeeResponse.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

Future<RequestState<List<CoffeeDomainModel>>> getCoffeeList(String endpoint, Network network) async {
  try {
    final response = await network.dio.get(endpoint);

    if (response.statusCode == 200 && response.data is List) {
      final coffeeList = (response.data as List)
          .map((e) => CoffeeHotResponse.fromJson(e))
          .toList();

      final domainList = coffeeList.toDomainList();

      return RequestState.success(domainList);
    } else {
      return RequestState.error([]);
    }
  } catch (e) {
    return RequestState.error([]);
  }
}