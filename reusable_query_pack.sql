
-- ================================
-- Reusable Query Pack for Serverless SQL Pool
-- Author: ChatGPT
-- Date: 2025-06-21
-- ================================

-- 1️⃣ Clean Patients
SELECT
    PatientID,
    Name,
    TRY_CAST(DOB AS DATE) AS DOB,
    Gender,
    Diagnosis
FROM dbo.patients;


-- 2️⃣ Clean Visits
SELECT
    VisitID,
    PatientID,
    TRY_CAST(VisitDate AS DATE) AS VisitDate,
    Provider,
    Reason
FROM dbo.visits;


-- 3️⃣ Clean Lab Results
SELECT
    LabResultID,
    PatientID,
    TestName,
    TRY_CAST(ResultValue AS FLOAT) AS ResultValue,
    TRY_CAST(ResultDate AS DATE) AS ResultDate
FROM dbo.lab_results;


-- 4️⃣ Clean Medications
SELECT
    MedicationID,
    PatientID,
    MedicationName,
    TRY_CAST(StartDate AS DATE) AS StartDate,
    TRY_CAST(EndDate AS DATE) AS EndDate
FROM dbo.medications;


-- 5️⃣ Example Join: Patients + Visits
WITH CleanPatients AS (
    SELECT
        PatientID,
        Name,
        TRY_CAST(DOB AS DATE) AS DOB,
        Gender,
        Diagnosis
    FROM dbo.patients
),
CleanVisits AS (
    SELECT
        VisitID,
        PatientID,
        TRY_CAST(VisitDate AS DATE) AS VisitDate,
        Provider,
        Reason
    FROM dbo.visits
)
SELECT
    p.PatientID,
    p.Name,
    p.DOB,
    p.Gender,
    p.Diagnosis,
    v.VisitID,
    v.VisitDate,
    v.Provider,
    v.Reason
FROM CleanPatients p
LEFT JOIN CleanVisits v
    ON p.PatientID = v.PatientID;
