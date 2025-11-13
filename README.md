Student Number: ST10452402   

Name and Surname: Sohan Seeth 

Module: Information Systems 1B 

Module Code: INSY6112 

Assessment Type: Exam 

Lecturer Name: Mr. Mick Gouweloos 

Question 4:

use_ST10452402

// Question 4.2: Insert patient data
db.members.insertMany([
  { MembersName: "Debbie", MemberSurname: "Theart", DateOfBirth: "1980-03-17" },
  { MembersName: "Thomas", MemberSurname: "Duncan", DateOfBirth: "1976-08-12" }
]);


// Question 4.3: Display all patients
db.members.find().pretty();


// Question 4.4: Display patients born after 1979-01-12
db.members.find(
  { DateOfBirth: { $gt: "1979-01-12" } }
).pretty();
