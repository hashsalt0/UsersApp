class Config{
  // flat file name to store json string
  static const saveFile = "data.bin";

  // minimum courses to enroll for a user
  static const int minCourseEntry = 4;

  // maximum courses to enroll for a user
  static const int maxCourseEntry = 4;

  static var envDevelopment = 0;
  static var envRelease = 1;

  static var env = envRelease;
}