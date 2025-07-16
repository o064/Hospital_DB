-- 1. Consultants
INSERT INTO Consultant (consultant_id, consultant_name) VALUES
(1, 'Dr. Ahmed Youssef'),
(2, 'Dr. Salma Hassan');

-- 2. Wards (temporarily using NULL as nurse FK removed)
INSERT INTO Ward (ward_id, ward_name, supervisor_nurse_id) VALUES
(101, 'Cardiology', 1),
(102, 'Pediatrics', 2);

-- 3. Nurses (now Ward exists)
INSERT INTO Nurse (nurse_id, number, nurse_name, nurse_address, ward_id) VALUES
(1, '01011111111', 'Nurse Mariam Tarek', 'Cairo', 101),
(2, '01022222222', 'Nurse Hossam Fathy', 'Giza', 102);

-- 4. Re-add FK from Ward → Nurse
ALTER TABLE Ward
ADD CONSTRAINT FK_Ward_Supervisor
FOREIGN KEY (supervisor_nurse_id) REFERENCES Nurse(nurse_id);

-- 5. Patients
INSERT INTO Patient (patient_id, name, date_of_birth, ward_id, leading_consultant_id) VALUES
(1001, 'Omar Ali', '2000-04-15', 101, 1),
(1002, 'Nour Samir', '1998-07-20', 102, 2);

-- 6. Examines
INSERT INTO Examines (patient_id, consultant_id) VALUES
(1001, 1),
(1001, 2),
(1002, 2);

-- 7. Drug
INSERT INTO Drug (code, recommended_dosage) VALUES
(201, '500mg twice daily'),
(202, '250mg once daily');

-- 8. Drug_Brand
INSERT INTO Drug_Brand (code, brand_name) VALUES
(201, 'Panadol Extra'),
(201, 'Paracetamol 500'),
(202, 'Zithromax');

-- 9. Drug_Administration
INSERT INTO Drug_Administration (admin_id, code, patient_id, nurse_id, admin_dosage, admin_date) VALUES
(1, 201, 1001, 1, '500mg', '2025-07-16 09:00:00'),
(2, 202, 1002, 2, '250mg', '2025-07-16 10:30:00');

