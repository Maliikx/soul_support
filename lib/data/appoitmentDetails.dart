class AppoitmentDetails {
  String Name = "";
  int Age = 7;
  String Gender = "";
  String Date = "";
  String Day = "";
  String Problem = "";
  String Time = "";

  String get name => Name;
  int get age => Age;
  String get gender => Gender;
  String get date => Date;
  String get day => Day;
  String get problem => Problem;
  String get time => Time;
  set name(String newName) {
    Name = newName;
  }

  set age(int newAge) {
    Age = newAge;
  }

  set gender(String newGender) {
    Gender = newGender;
  }

  set date(String newDate) {
    Date = newDate;
  }

  set day(String newDay) {
    Day = newDay;
  }

  set problem(String newProblem) {
    Problem = newProblem;
  }
set time(String newTime) {
    Time = newTime;
  }

}
