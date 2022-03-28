import 'dart:io';

import '../model/course.dart';

class StringValues {
  static const unknownValue = "unknown";
  static const addUserMenuText = "Add User details.";
  static const displayUserMenuText = "Display User details.";
  static const deleteUserMenuText = "Delete User details";
  static const saveUserMenuText = "Save User details.";
  static const exitMenuText = "Exit";

  static const name = "Name ";
  static const age = "Age";
  static const address = "Address";
  static const rollNumber = "Roll Number";
  static const courses = "courses";

  static const fullNamePrompt = "Enter Full $name ";
  static const agePrompt = "Enter $age";
  static const addressPrompt = "Enter $address";
  static const rollNumberPrompt = "Enter $rollNumber";


  static String displayUserMenuSortByText = "Enter feild name to sortby ";
  static String displayUserMenuSortAscendingChoice = "Sort By Ascending Order";
  static String displayUserMenuSortDescendingChoice = "Sort By Descending Order";

  static get coursesPrompt => "Enter four $courses from  ${Course.values.map((e) {e.name;})}";

  static const addUserMenuSucess = "Sucessfully created user.";

  static const rollNumberNotFound = "$rollNumber is not found.";
  
  static const coursesEntryPrompt = "Enter $courses of value";

  static const fullNameError = "Invalid Full  $name ";
  static const ageError = "Invalid $age";
  static const addressError = "Invalid $address";
  static const rollNumberError = "Invalid $rollNumber entered, enter an integer value";
  static get coursesError => "Invalid $courses entered choose from ${Course.values}";

  // serial values should be unique 
  static const fullNameSerial = "f";
  static const ageSerial = "ag";
  static const addressSerial = "ad";
  static const rollNumberSerial = "r";
  static const coursesSerial = "c";
  static String displayUserMenuSortBySerial = "d";

  static get lineBreak => '-' * stdout.terminalColumns;
}
