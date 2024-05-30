abstract class AppCubitStates {}

class AppInitialState extends AppCubitStates{}

class AppAddClientLoadingState extends AppCubitStates{}
class AppAddClientSuccessState extends AppCubitStates{}
class AppAddClientErrorState extends AppCubitStates{}

class AppGetUsersLoadingState extends AppCubitStates{}
class AppGetUsersSuccessState extends AppCubitStates{}
class AppGetUsersErrorState extends AppCubitStates{}


class AppGetWorkersLoadingState extends AppCubitStates{}
class AppGetWorkersSuccessState extends AppCubitStates{}
class AppGetWorkersErrorState extends AppCubitStates{}


class AppSearchWorkersLoadingState extends AppCubitStates{}
class AppSearchWorkersSuccessState extends AppCubitStates{}
class AppSearchWorkersErrorState extends AppCubitStates{}


class AppSearchCarsLoadingState extends AppCubitStates{}
class AppSearchCarsSuccessState extends AppCubitStates{}
class AppSearchCarsErrorState extends AppCubitStates{}



class AppGetCarServicesByNumberLoadingState extends AppCubitStates{}
class AppGetCarServicesByNumberSuccessState extends AppCubitStates{}
class AppGetCarServicesByNumberErrorState extends AppCubitStates{
  String error;
  AppGetCarServicesByNumberErrorState(this.error);
}

class AppChangeServiceStateLoadingState extends AppCubitStates{}
class AppChangeServiceStateSuccessState extends AppCubitStates{}
class AppChangeServiceStateErrorState extends AppCubitStates{
  String error;
  AppChangeServiceStateErrorState(this.error);
}

class AppDatePickerChangeState extends AppCubitStates{}


class AppLoginLoadingState extends AppCubitStates{}
class AppLoginSuccessState extends AppCubitStates{}
class AppLoginErrorState extends AppCubitStates{}
class AppLoginVerifyState extends AppCubitStates{}
class AppLoginFirstTimeState extends AppCubitStates{}




class AppSetFirstTimeLoadingState extends AppCubitStates{}
class AppSetFirstTimeSuccessState extends AppCubitStates{}
class AppSetFirstTimeErrorState extends AppCubitStates{}




class AppForgetPasswordLoadingState extends AppCubitStates{}
class AppForgetPasswordSuccessState extends AppCubitStates{}
class AppForgetPasswordErrorState extends AppCubitStates{}


class AppResetPasswordLoadingState extends AppCubitStates{}
class AppResetPasswordSuccessState extends AppCubitStates{}
class AppResetPasswordErrorState extends AppCubitStates{}



class AppAddWorkerLoadingState extends AppCubitStates{}
class AppAddWorkerSuccessState extends AppCubitStates{}
class AppAddWorkerErrorState extends AppCubitStates{}


class AppGetAllCarsLoadingState extends AppCubitStates{}
class AppGetAllCarsSuccessState extends AppCubitStates{}
class AppGetAllCarsErrorState extends AppCubitStates{}


class AppGetRepairingCarsLoadingState extends AppCubitStates{}
class AppGetRepairingCarsSuccessState extends AppCubitStates{}
class AppGetRepairingCarsErrorState extends AppCubitStates{}



class AppGetListOfComponentsLoadingState extends AppCubitStates{}
class AppGetListOfComponentsSuccessState extends AppCubitStates{}
class AppGetListOfComponentsErrorState extends AppCubitStates{}


class AppAddComponentLoadingState extends AppCubitStates{}
class AppAddComponentSuccessState extends AppCubitStates{}
class AppAddComponentErrorState extends AppCubitStates{}



class AppSearchUsersLoadingState extends AppCubitStates{}
class AppSearchUsersSuccessState extends AppCubitStates{}
class AppSearchUsersErrorState extends AppCubitStates{}


class AppSearchRepairingCarsLoadingState extends AppCubitStates{}
class AppSearchRepairingCarsSuccessState extends AppCubitStates{}
class AppSearchRepairingCarsErrorState extends AppCubitStates{}


class AppEditComponentLoadingState extends AppCubitStates{}
class AppEditComponentSuccessState extends AppCubitStates{}
class AppEditComponentErrorState extends AppCubitStates{}



class AppGetSpecificUserLoadingState extends AppCubitStates{}
class AppGetSpecificUserSuccessState extends AppCubitStates{}
class AppGetSpecificUserErrorState extends AppCubitStates{}


class AppAddCarLoadingState extends AppCubitStates{}
class AppAddCarSuccessState extends AppCubitStates{}
class AppAddCarErrorState extends AppCubitStates{}


class AppUpdateUsersLoadingState extends AppCubitStates{}
class AppUpdateUsersSuccessState extends AppCubitStates{}
class AppUpdateUsersErrorState extends AppCubitStates{}


class AppGetSpecificCarLoadingState extends AppCubitStates{}
class AppGetSpecificCarSuccessState extends AppCubitStates{}
class AppGetSpecificCarErrorState extends AppCubitStates{}


class AppAddRepairLoadingState extends AppCubitStates{}
class AppAddRepairSuccessState extends AppCubitStates{}
class AppAddRepairErrorState extends AppCubitStates{}


class AppGetAllRepairsForSpecificCarLoadingState extends AppCubitStates{}
class AppGetAllRepairsForSpecificCarSuccessState extends AppCubitStates{}
class AppGetAllRepairsForSpecificCarErrorState extends AppCubitStates{}


class AppUpdateCarLoadingState extends AppCubitStates{}
class AppUpdateCarSuccessState extends AppCubitStates{}
class AppUpdateCarErrorState extends AppCubitStates{}



class AppGetMainPramsLoadingState extends AppCubitStates{}
class AppGetMainPramsSuccessState extends AppCubitStates{}
class AppGetMainPramsErrorState extends AppCubitStates{}


class AppUpdateWorkerLoadingState extends AppCubitStates{}
class AppUpdateWorkerSuccessState extends AppCubitStates{}
class AppUpdateWorkerErrorState extends AppCubitStates{}


class AppGetCompletedRepairsLoadingState extends AppCubitStates{}
class AppGetCompletedRepairsSuccessState extends AppCubitStates{}
class AppGetCompletedRepairsErrorState extends AppCubitStates{}


class AppGetMonthWorkLoadingState extends AppCubitStates{}
class AppGetMonthWorkSuccessState extends AppCubitStates{}
class AppGetMonthWorkErrorState extends AppCubitStates{}


class AppSearchComponentsLoadingState extends AppCubitStates{}
class AppSearchComponentsSuccessState extends AppCubitStates{}
class AppSearchComponentsErrorState extends AppCubitStates{}


class AppAddThingLoadingState extends AppCubitStates{}
class AppAddThingSuccessState extends AppCubitStates{}
class AppAddThingErrorState extends AppCubitStates{}


class AppAddConstantLoadingState extends AppCubitStates{}
class AppAddConstantSuccessState extends AppCubitStates{}
class AppAddConstantErrorState extends AppCubitStates{}


class AppDeleteWorkerLoadingState extends AppCubitStates{}
class AppDeleteWorkerSuccessState extends AppCubitStates{}
class AppDeleteWorkerErrorState extends AppCubitStates{}


class AppAddRewardOrLoansLoadingState extends AppCubitStates{}
class AppAddRewardOrLoansSuccessState extends AppCubitStates{}
class AppAddRewardOrLoansErrorState extends AppCubitStates{}
