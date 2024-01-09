-- Create Patients table with PatientID as a private key and a foreign key referencing Psychologists table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    PsychologistID INT,
    -- Foreign key constraint
    FOREIGN KEY (PsychologistID) REFERENCES Psychologists(PsychologistID)
);


CREATE TABLE Psychologists (
    PsychologistID INT PRIMARY KEY,
    PsychologistName VARCHAR(50),
    Specialty VARCHAR(50)
    -- Other relevant columns related to psychologists' information
);



-- Drop primary key constraint
ALTER TABLE Patients DROP CONSTRAINT Patients_pkey;

-- Drop foreign key constraint
ALTER TABLE Patients DROP CONSTRAINT patients_psychologistid_fkey;


-- Add a new primary key constraint on PatientID column
ALTER TABLE Patients ADD PRIMARY KEY (PatientID);


-- Assuming an AppointmentDate column exists for appointment scheduling
ALTER TABLE Patients ADD COLUMN AppointmentDate DATE;

-- Create composite primary key on PatientID and AppointmentDate columns
ALTER TABLE Patients ADD PRIMARY KEY (PatientID, AppointmentDate);


-- Drop foreign key constraint referencing Psychologists table
ALTER TABLE Patients DROP CONSTRAINT patients_psychologistid_fkey;


-- Add new foreign key constraint referencing Psychologists table
ALTER TABLE Patients ADD FOREIGN KEY (PsychologistID) REFERENCES Psychologists(PsychologistID);