import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/register_user.dart';
import 'features/auth/presentation/blocs/auth_bloc.dart';
import 'features/campaign/data/data_sources/campaign_remote_data_source.dart';
import 'features/campaign/data/repositories/campaign_repository_impl.dart';
import 'features/campaign/domain/repositories/campaign_repository.dart';
import 'features/campaign/domain/use_cases/get_campaigns_usecase.dart';
import 'features/campaign/presentation/blocs/campaign_bloc.dart'; // Kita akan buat ini di Langkah 2

final sl = GetIt.instance; // sl = Service Locator

Future<void> init() async {
  //! Features - Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(registerUser: sl()));

  // Use Case
  sl.registerLazySingleton(() => RegisterUser(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  //! Features - Campaigns
  //! External
  sl.registerLazySingleton(() => http.Client());

  // BLoC
  sl.registerFactory(() => CampaignBloc(getCampaignsUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCampaignsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<CampaignRepository>(
    () => CampaignRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CampaignRemoteDataSource>(
    () => CampaignRemoteDataSourceImpl(),
  );
}
