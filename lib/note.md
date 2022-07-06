<!-- Build Run to Generate From Json and To Json -->
flutter pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs
<!--  :::::::::::::::EXAMPLE::::::::::::::

factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
 -->

 <!-- 
    :: When Using nested models ::
    @JsonSerializable(explicitToJson: true) 
  -->

  <!-- 
  ::::::::::CONVERTER::::::::::::::::::
  
class SubjectConverter
    implements JsonConverter<SubjectModel?, Map<String, dynamic>?> {
  const SubjectConverter();

  @override
  SubjectModel? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SubjectModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SubjectModel? data) {
    if (data == null) {
      return null;
    }
    return data.toJson();
  }
}

   -->

<!-- Generate Splash Icons  -->
flutter pub run flutter_native_splash:create
<!-- Flutter Launcher Icons  -->
flutter pub run flutter_launcher_icons:main