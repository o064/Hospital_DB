-- 1. Consultant Table
CREATE TABLE Consultant (
    consultant_id INT PRIMARY KEY,
    consultant_name VARCHAR(100) NOT NULL
);

-- 2. Ward Table
CREATE TABLE Ward (
    ward_id INT PRIMARY KEY,
    ward_name VARCHAR(100) NOT NULL,
    supervisor_nurse_id INT NOT NULL UNIQUE
    -- FK will be added later (Nurse not created yet)
);

-- 3. Nurse Table
CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    number VARCHAR(20) NOT NULL UNIQUE,
    nurse_name VARCHAR(100) NOT NULL,
    nurse_address VARCHAR(100) NOT NULL,
    ward_id INT NOT NULL,
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);

-- add the FK from Ward → Nurse
ALTER TABLE Ward
ADD CONSTRAINT FK_Ward_Supervisor
FOREIGN KEY (supervisor_nurse_id) REFERENCES Nurse(nurse_id);

-- 4. Patient Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    ward_id INT NOT NULL,
    leading_consultant_id INT NOT NULL,
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id),
    FOREIGN KEY (leading_consultant_id) REFERENCES Consultant(consultant_id)
);

-- 5. Examines Table 
CREATE TABLE Examines (
    patient_id INT NOT NULL,
    consultant_id INT NOT NULL,
    PRIMARY KEY (patient_id, consultant_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (consultant_id) REFERENCES Consultant(consultant_id)
);

-- 6. Drug Table
CREATE TABLE Drug (
    code INT PRIMARY KEY,
    recommended_dosage VARCHAR(100) NOT NULL
);

-- 7. Drug_Brand Table
CREATE TABLE Drug_Brand (
    code INT NOT NULL,
    brand_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (code, brand_name),
    FOREIGN KEY (code) REFERENCES Drug(code)
);

-- 8. Drug_Administration Table
CREATE TABLE Drug_Administration (
    admin_id INT PRIMARY KEY,
    code INT NOT NULL,
    patient_id INT NOT NULL,
    nurse_id INT NOT NULL,
    admin_dosage VARCHAR(100) NOT NULL,
    admin_date DATETIME,
    FOREIGN KEY (code) REFERENCES Drug(code),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id)
);
