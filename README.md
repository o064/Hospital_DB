# Hospital_DB

# 🏥 Hospital Management Database 

## 📄 Overview

This database is designed to manage and track the operations within a general hospital. It models entities such as patients, wards, nurses, consultants, and drugs. The design ensures data integrity and reflects real-world constraints such as one-to-one nurse-to-ward assignments, many-to-many consultant examinations, and drug administration tracking with timestamps.

---

## 📦 Entity Descriptions

### 1. Patient

The `Patient` entity stores information about each patient in the hospital. It includes the patient's ID, name, date of birth, the ward they are hosted in, and the ID of the leading consultant responsible for their care. Each patient belongs to exactly one ward and has one leading consultant but can also be examined by multiple other consultants.

### 2. Ward

The `Ward` entity represents specialized departments within the hospital. Each ward is identified by a unique ID and a name. Every ward is supervised by exactly one nurse, and this relationship is modeled with a one-to-one constraint using a foreign key to the `Nurse` table. Additionally, each ward can host multiple patients.

### 3. Nurse

The `Nurse` entity stores nurse-related data including a unique nurse ID, contact number, name, and address. Each nurse serves in one specific ward and also supervises one ward. The ward assignment is maintained through a foreign key relationship with the `Ward` table. Nurses are also responsible for drug administration.

### 4. Consultant

The `Consultant` table holds the list of medical consultants in the hospital. Each consultant has a unique ID and name. A consultant may lead the treatment of multiple patients and may also examine other patients. The one-to-many relationship for leading patients and the many-to-many relationship for examining patients are both modeled.

### 5. Examines

The `Examines` table is a junction table that connects `Consultant` and `Patient` in a many-to-many relationship. It tracks which consultants have examined which patients, independent of the leading consultant assigned.

### 6. Drug

The `Drug` entity stores medical drugs used in the hospital. Each drug is identified by a unique code and has a recommended dosage. Drugs are used in patient treatment and tracked during administration.

### 7. Drug_Brand

The `Drug_Brand` table lists various brand names associated with each drug. A single drug may have multiple brands, represented as a one-to-many relationship from `Drug` to `Drug_Brand`.

### 8. Drug_Administration

This table tracks each instance of a drug being administered to a patient. It captures the administering nurse, the drug code, patient ID, dosage given, and the exact date and time. This ternary relationship ensures accountability and traceability in medication management.

---

## 🔄 Relationships Summary

| Relationship                    | Type                | Description                                                                          |
| ------------------------------- | ------------------- | ------------------------------------------------------------------------------------ |
| Ward — Patient                  | 1:N                 | A ward can host many patients.                                                       |
| Patient — Consultant (leading)  | M:1                 | Each patient has one leading consultant.                                             |
| Patient — Consultant (examines) | M:N (via Examines)  | Consultants may examine many patients. Patients may be examined by many consultants. |
| Ward — Nurse                    | 1:1                 | Each ward is supervised by one nurse. Each nurse supervises one ward.                |
| Nurse — Drug_Administration     | 1:N                 | A nurse may administer many drugs.                                                   |
| Patient — Drug_Administration   | 1:N                 | A patient may receive many administered drugs.                                       |
| Drug — Drug_Brand               | 1:N                 | One drug may have many brands.                                                       |
| Drug — Drug_Administration      | 1:N                 | A drug may be administered multiple times.                                           |

##  Erd diagram (conceptual desgin)
<img width="3752" height="2649" alt="image" src="https://github.com/user-attachments/assets/c0a282f7-8110-4764-aeb3-b9c2094bb6d1" />

## Tables Schema
<img width="410" height="305" alt="Screenshot 2025-07-16 214811" src="https://github.com/user-attachments/assets/93597552-aa00-4833-b94d-637a062d0946" />

