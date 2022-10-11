// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserModel extends ParseUser implements ParseCloneable {
  UserModel(String? username, String? password, String? emailAddress)
      : super(username, password, emailAddress);

  UserModel.clone() : this(null, null, null);

  UserModel.forQuery() : super(null, null, null);

  @override
  clone(Map map) => UserModel.clone()..fromJson(map as Map<String, dynamic>);

  static Future<UserModel> getUserResult(dynamic user) async {
    UserModel? user = await ParseUser.currentUser();
    user = UserModel.clone()..fromJson(user as Map<String, dynamic>);

    return user;
  }

  static String keyObjectId = "objectId";

  // User role
  static const String roleUser = "user";
  static const String roleAdmin = "admin";

  // Filter
  static const String keyGenderMale = "male";
  static const String keyGenderFemale = "female";
  static const String keyGenderBoth = "both";

  // Backend field
  static const String keyUid = "uid";
  static const String keyId = "objectId";
  static const String keySessionToken = 'sessionToken';
  static const String keyCreatedAt = "createdAt";
  static const String keyUpdatedAt = "updatedAt";
  static const String keyInstallation = "installation";

  // User sensitive data
  static const String keyRole = "role";
  static const String keyUsername = "username";
  static const String keyEmail = "email";
  static const String keyEmailPublic = 'email_public';
  static const String keyEmailVerified = 'emailVerified';
  static const String keySecondaryPassword = 'secondary_password';
  static const String keyConfirmSecondaryPassword =
      'confirm_secondary_password';
  static const String keyHasPassword = "has_password";
  static const String keyHasChangedName = "has_name_changed";
  static const String keyAccountHidden = "account_hidden";
  static const String keyReferralCode = "referral_code";

  // User required data
  static const String keyFullName = "name";
  static const String keyFirstName = "first_name";
  static const String keyLastName = "last_name";
  static const String keyBirthday = "birthday";
  static const String keyAge = "age";
  static const String keyGender = "gender";
  static const String keyAvatar = "avatar";

  // Phone data
  static const String keyCountry = "country";
  static const String keyCountryCode = "country_code";
  static const String keyCountryDialCode = "country_dial_code";
  static const String keyPhoneNumber = "phone_number";
  static const String keyPhoneNumberFull = "phone_number_full";

  // User additional data
  static const String keyAboutMe = "aboutMe";
  static const String keyGeoPoint = "geopoint";
  static const String keyHasGeoPoint = "hasGeopoint";
  static const String keyLocation = "location";
  static const String keyCity = "city";
  static const String keyHideMyLocation = "hideLocation";
  static const String keyUserAccountDeleted = "accountDeleted";
  static const String keyUserAccountDeletedReason = "accountDeletedReason";

  String? get getSessionToken => get<String>(keySessionToken);

  int? get getUid => get<int>(keyUid);
  set setUid(int uid) => set<int>(keyUid, uid);

  String? get getUserRole => get<String>(keyRole);
  set setUserRole(String role) => set<String>(keyRole, role);

  String? get getUsername => get<String>(keyUsername);
  set setUsername(String username) => set<String>(keyUsername, username);

  String? get getEmail => get<String>(keyEmail);
  set setEmail(String email) => set<String>(keyEmail, email);

  String? get getEmailPublic => get<String>(keyEmailPublic);
  set setEmailPublic(String emailPublic) =>
      set<String>(keyEmailPublic, emailPublic);

  String? get getFullName => get<String>(keyFullName);
  set setFullName(String fullName) => set<String>(keyFullName, fullName);

  String? get getFirstName => get<String>(keyFirstName);
  set setFirstName(String firstName) => set<String>(keyFirstName, firstName);

  String? get getLastName => get<String>(keyLastName);
  set setLastName(String lastName) => set<String>(keyLastName, lastName);

  String? get getReferralCode => get<String>(keyReferralCode);
  set setReferralCode(String referralCode) =>
      set<String>(keyReferralCode, referralCode);

  String? get getGender => get<String>(keyGender);
  set setGender(String gender) => set<String>(keyGender, gender);

  ParseFileBase? get getAvatar => get<ParseFileBase>(keyAvatar);
  set setAvatar(ParseFileBase parseFileBase) =>
      set<ParseFileBase>(keyAvatar, parseFileBase);

  DateTime? get getBirthday => get<DateTime>(keyBirthday);
  set setBirthday(DateTime birthday) => set<DateTime>(keyBirthday, birthday);

  bool? get getEmailVerified => get<bool>(keyEmailVerified);
  set setEmailVerified(bool emailVerified) =>
      set<bool>(keyEmailVerified, emailVerified);

  bool? get getAccountDeleted => get<bool>(keyUserAccountDeleted);
  set setAccountDeleted(bool deleted) =>
      set<bool>(keyUserAccountDeleted, deleted);

  String? get getAccountDeletedReason =>
      get<String>(keyUserAccountDeletedReason);
  set setAccountDeletedReason(String reason) =>
      set<String>(keyUserAccountDeletedReason, reason);

  bool? get getHasPassword => get<bool>(keyHasPassword);
  set setHasPassword(bool hasPassword) =>
      set<bool>(keyHasPassword, hasPassword);

  bool? get getHasGeoPoint {
    bool? hasGeoPoint = get<bool>(keyHasGeoPoint);
    if (hasGeoPoint != null) {
      return hasGeoPoint;
    } else {
      return false;
    }
  }

  set setHasGeoPoint(bool hasGeoPoint) =>
      set<bool>(keyHasGeoPoint, hasGeoPoint);

  String? get getLocation {
    String? location = get<String>(keyLocation);
    if (location != null && location.isNotEmpty) {
      if (getHideMyLocation == true) {
        return "edit_profile.city_hidden".tr();
      } else {
        return location;
      }
    } else {
      return "edit_profile.no_location_update".tr();
    }
  }

  String? get getLocationOrEmpty {
    String? location = get<String>(keyLocation);
    if (location != null && location.isNotEmpty) {
      return location;
    } else {
      return "";
    }
  }

  String? get getLocationOnly {
    String? location = get<String>(keyLocation);
    if (location != null && location.isNotEmpty) {
      return location;
    } else {
      return "edit_profile.add_city_name".tr();
    }
  }

  set setLocation(String locationName) =>
      set<String>(keyLocation, locationName);

  String? get getCity {
    String? city = get<String>(keyCity);
    if (city != null && city.isNotEmpty) {
      return city;
    } else {
      return "";
    }
  }

  set setCity(String city) => set<String>(keyCity, city);

  String? get getCountry {
    String? country = get<String>(keyCountry);
    if (country != null && country.isNotEmpty) {
      return country;
    } else {
      return "";
    }
  }

  set setCountry(String country) => set<String>(keyCountry, country);

  String? get getCountryCode => get<String>(keyCountryCode);
  set setCountryCode(String countryCode) =>
      set<String>(keyCountryCode, countryCode);

  String? get getCountryDialCode => get<String>(keyCountryDialCode);
  set setCountryDialCode(String countryDialCode) =>
      set<String>(keyCountryDialCode, countryDialCode);

  String? get getPhoneNumber {
    String? phone = get<String>(keyPhoneNumber);
    if (phone != null && phone.isNotEmpty) {
      return phone;
    } else {
      return "";
    }
  }

  set setPhoneNumber(String phoneNumber) =>
      set<String>(keyPhoneNumber, phoneNumber);

  set setPhoneNumberFull(String phoneNumberFull) =>
      set<String>(keyPhoneNumberFull, phoneNumberFull);

  String? get getPhoneNumberFull {
    String? phone = get<String>(keyPhoneNumberFull);
    if (phone != null && phone.isNotEmpty) {
      return phone;
    } else {
      return "";
    }
  }

  String? get getAboutYou {
    String? about = get<String>(keyAboutMe);

    if (about != null && about.isNotEmpty) {
      return about;
    } else {
      return "";
    }
  }

  set setAboutYou(String about) => set<String>(keyAboutMe, about);

  String? get getSecondaryPassword => get<String>(keySecondaryPassword);
  set setSecondaryPassword(String secondaryPassword) =>
      set<String>(keySecondaryPassword, secondaryPassword);

  String? get getkeyConfirmSecondaryPassword =>
      get<String>(keyConfirmSecondaryPassword);
  set setkeyConfirmSecondaryPassword(String confirmsecondaryPassword) =>
      set<String>(keyConfirmSecondaryPassword, confirmsecondaryPassword);

  bool? get getHideMyLocation {
    bool? hideMyLocation = get<bool>(keyHideMyLocation);
    if (hideMyLocation != null) {
      return hideMyLocation;
    } else {
      return false;
    }
  }

  set setHideMyLocation(bool hideMyLocation) =>
      set<bool>(keyHideMyLocation, hideMyLocation);

  ParseGeoPoint? get getGeoPoint => get<ParseGeoPoint>(keyGeoPoint);
  set setGeoPoint(ParseGeoPoint geoPoint) =>
      set<ParseGeoPoint>(keyGeoPoint, geoPoint);

  int? get getAge => get<int>(keyAge);
  set setAge(int age) => set<int>(keyAge, age);

  dynamic get getInstallation => get(keyInstallation);
  set setInstallation(ParseInstallation installation) =>
      set<ParseInstallation>(keyInstallation, installation);
}
