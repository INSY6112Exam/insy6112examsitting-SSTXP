CREATE SCHEMA Clinic;
Use Clinic;

-- Question 3.1: Create the Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    PatientSurname VARCHAR(50),
    DateOfBirth DATE
);

-- Question 3.2: Create the Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    DoctorSurname VARCHAR(50)
);

-- Question 3.3: Create the Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Duration INT,
    DoctorID INT,
    PatientID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Question 3.4: Insert data into all tables
INSERT INTO Patient (PatientID, PatientName, PatientSurname, DateOfBirth) VALUES
(1, 'Debbie', 'Theart', '1980-03-17'),
(2, 'Thomas', 'Duncan', '1976-08-12');

INSERT INTO Doctor (DoctorID, DoctorName, DoctorSurname) VALUES
(1, 'Zintle', 'Nukani'),
(2, 'Ravi', 'Maharaj');

INSERT INTO Appointments (AppointmentID, AppointmentDate, AppointmentTime, Duration, DoctorID, PatientID) VALUES
(1, '2025-01-15', '09:00', 15, 2, 1),
(2, '2025-01-18', '15:00', 30, 2, 2),
(3, '2025-01-20', '10:00', 15, 1, 1),
(4, '2025-01-21', '11:00', 15, 2, 1);

-- Question 3.5: Display appointments between given dates
SELECT *
FROM Appointments
WHERE AppointmentDate BETWEEN '2025-01-16' AND '2025-01-20';

-- Question 3.6: Display all appointments with doctor and patient names
SELECT 
    A.AppointmentDate,
    A.AppointmentTime,
    D.DoctorName,
    D.DoctorSurname,
    P.PatientName,
    P.PatientSurname
FROM Appointments A
JOIN Doctor D ON A.DoctorID = D.DoctorID
JOIN Patient P ON A.PatientID = P.PatientID
ORDER BY A.AppointmentDate DESC;

-- Question 3.7: Create view for DoctorID = 2
CREATE VIEW Doctor2Patients AS
SELECT DISTINCT
    P.PatientName,
    P.PatientSurname
FROM Appointments A
JOIN Patient P ON A.PatientID = P.PatientID
WHERE A.DoctorID = 2
ORDER BY P.PatientSurname ASC;
