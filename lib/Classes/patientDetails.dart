class Patientdetails {
  String FirstName = "";
  String PhoneNumber = "";
  String Gender = "";
  String email = "";
  String password = "";
  String Moodlogging = "";
 
  String get firstName =>FirstName;
  String get phoneNumber => PhoneNumber;
  String get gender => Gender;
  String get Email => email;
  String get Password =>password;
  String get moodlogging=> Moodlogging;

  set name(String newName) {
    FirstName= newName;
  }

  set phoneNumber(String newPhoneNumber) {
    PhoneNumber = newPhoneNumber;
  }

  set gender(String newGender) {
    Gender = newGender;
  }

  set Email(String newemail) {
    email = newemail;
  }

  set Password(String newpassword) {
    password= newpassword;
  }

  set moodlogging(String newMoodlogging) {
    Moodlogging = newMoodlogging;
  }


}
