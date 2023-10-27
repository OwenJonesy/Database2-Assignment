-- Drop the tables if they exist (in the reverse order of creation to avoid foreign key constraints)
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Assessment;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Lesson;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS DrivingStudent;
DROP TABLE IF EXISTS BookingStaff;

-- Create the DrivingStudent table (formerly Student)
CREATE TABLE DrivingStudent (
    StudentID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    RegistrationNumber VARCHAR(50) UNIQUE,
    NCTStatus VARCHAR(50)
);

-- Create the Instructor table
CREATE TABLE Instructor (
    InstructorID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Availability VARCHAR(255)
);

-- Create the Lesson table
CREATE TABLE Lesson (
    LessonID SERIAL PRIMARY KEY,
    LessonNumber INT,
    LessonTopic VARCHAR(255)
);

-- Create the Car table
CREATE TABLE Car (
    CarID SERIAL PRIMARY KEY,
    CarType VARCHAR(255),
    Availability VARCHAR(255)
);

-- Create the BookingStaff table
CREATE TABLE BookingStaff (
    StaffID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(255)
);

-- Create the Booking table
CREATE TABLE Booking (
    BookingID SERIAL PRIMARY KEY,
    StudentID INT,
    InstructorID INT,
    LessonID INT,
    CarID INT,
    StaffID INT,
    DateTime TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES DrivingStudent(StudentID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (LessonID) REFERENCES Lesson(LessonID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (StaffID) REFERENCES BookingStaff(StaffID)
);

-- Create the Assessment table
CREATE TABLE Assessment (
    AssessmentID SERIAL PRIMARY KEY,
    StudentID INT,
    InstructorID INT,
    EstimatedLessons INT,
    AssessmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES DrivingStudent(StudentID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Create the Payment table
CREATE TABLE Payment (
    PaymentID SERIAL PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES DrivingStudent(StudentID)
);






SELECT * FROM DrivingStudent;
SELECT * FROM Instructor;
SELECT * FROM Lesson;
SELECT * FROM Car;
SELECT * FROM BookingStaff;
SELECT * FROM Booking;
SELECT * FROM Assessment;
SELECT * FROM Payment;






-- Insert sample data into the "DrivingStudent" table
INSERT INTO DrivingStudent (Name, RegistrationNumber, NCTStatus)
VALUES ('John Doe', 'DS12345', 'Valid'),
       ('Jane Smith', 'DS67890', 'Expired'),
       ('Alice Johnson', 'DS11111', 'Valid'),
       ('Bob Wilson', 'DS22222', 'Expired');

-- Insert sample data into the "Instructor" table
INSERT INTO Instructor (Name, Availability)
VALUES ('Instructor A', 'Available'),
       ('Instructor B', 'Not Available'),
       ('Instructor C', 'Available'),
       ('Instructor D', 'Not Available');

-- Insert sample data into the "Lesson" table
INSERT INTO Lesson (LessonNumber, LessonTopic)
VALUES (1, 'Parallel Parking'),
       (2, 'Lane Change'),
       (3, 'Parking on a Hill'),
       (4, 'Intersection Right of Way');

-- Insert sample data into the "Car" table
INSERT INTO Car (CarType, Availability)
VALUES ('Sedan', 'Available'),
       ('SUV', 'Not Available'),
       ('Hatchback', 'Available'),
       ('Convertible', 'Not Available');

-- Insert sample data into the "BookingStaff" table
INSERT INTO BookingStaff (Name, Role)
VALUES ('Staff Member 1', 'Booking Agent'),
       ('Staff Member 2', 'Coordinator'),
       ('Staff Member 3', 'Coordinator'),
       ('Staff Member 4', 'Booking Agent');

-- Insert sample data into the "Booking" table
INSERT INTO Booking (StudentID, InstructorID, LessonID, CarID, DateTime, StaffID)
VALUES (1, 1, 1, 1, '2023-10-25 09:00:00', 1),
       (2, 2, 2, 2, '2023-10-26 10:00:00', 2),
       (3, 3, 3, 3, '2023-10-27 11:00:00', 1),
       (4, 4, 4, 4, '2023-10-28 14:00:00', 2);

-- Insert sample data into the "Assessment" table
INSERT INTO Assessment (StudentID, InstructorID, EstimatedLessons, AssessmentDate)
VALUES (1, 1, 10, '2023-10-30'),
       (2, 2, 8, '2023-11-01'),
       (3, 3, 9, '2023-10-30'),
       (4, 4, 7, '2023-11-02');

-- Insert sample data into the "Payment" table
INSERT INTO Payment (StudentID, Amount, PaymentDate, PaymentMethod)
VALUES (1, 200.00, '2023-10-25', 'Credit Card'),
       (2, 180.00, '2023-10-26', 'Cheque'),
       (3, 250.00, '2023-10-27', 'Credit Card'),
       (4, 210.00, '2023-10-28', 'Cash');




