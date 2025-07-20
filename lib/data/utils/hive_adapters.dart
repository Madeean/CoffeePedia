import 'package:hive_ce/hive.dart';
import 'package:technical_test/domain/favorite/model/FavoriteDomainModel.dart';

@GenerateAdapters([AdapterSpec<FavoriteDomainModel>()])
part 'hive_adapters.g.dart';
