
// abstract class IExerciseService {
//   IExerciseService(this.dio);
//   final Dio dio;

//   Future<List<ExerciseModel>?> fetchExerciseItems(
//     BuildContext context, {
//     String? nameFilter,
//     String? muscleFilter,
//     String? typeFilter,
//   });
// }

// class ExerciseService extends IExerciseService with ChangeNotifier {
//   ExerciseService(super.dio);
//   @override
//   Future<List<ExerciseModel>?> fetchExerciseItems(
//     BuildContext context, {
//     String? nameFilter,
//     String? muscleFilter,
//     String? typeFilter,
//   }) async {
//     Provider.of<IsLoadingProvider>(context, listen: false).isLoading = true;

//     String baseUrlCompleter =
//         '?type=${typeFilter ?? ''}&muscle=${muscleFilter ?? ''}&name=${nameFilter ?? ''}';
//     final response = await dio.get(
//       baseUrlCompleter,
//       options: Options(
//         headers: ConstantAppApiKey.apiKeyMap,
//       ),
//     );

//     if (response.statusCode == HttpStatus.ok) {
//       final jsonBody = response.data;

//       if (jsonBody is List) {
//         Provider.of<IsLoadingProvider>(context, listen: false)
//             .changeLoadingState(false);
//         notifyListeners();

//         List<ExerciseModel> value =
//             jsonBody.map((e) => ExerciseModel.fromMap(e)).toList();
//         return value;
//       }
//     }
//     return null;
//   }
// }