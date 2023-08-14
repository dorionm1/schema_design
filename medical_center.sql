DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

--Tables: Doctor, Patient, Appointment, Diagnosis

CREATE TABLE doctor
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    employee_number VARCHAR,
    email VARCHAR,
    phone_number VARCHAR(15)
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email VARCHAR,
    phone_number VARCHAR(15)
);

--Table with all possible diagnosis's
CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    diagnosis_type VARCHAR,
    diagnosis_desc VARCHAR
);

CREATE TABLE appointment
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    doctor_id INTEGER REFERENCES doctor(id),
    patient_id INTEGER REFERENCES patient(id)
);

--Table with all posisble symptoms
CREATE TABLE symptoms
(
    id SERIAL PRIMARY KEY,
    symptom_type VARCHAR,
    symptom_desc VARCHAR    
);

--Table with all patient symptoms
CREATE TABLE patient_symptoms
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patient(id),
    symptom_id INTEGER REFERENCES symptoms(id)
);

--Table with all patient disgnosis's
CREATE TABLE patient_diagnosis
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patient(id),
    diagnosis_id INTEGER REFERENCES diagnosis(id),
    doctor_id INTEGER REFERENCES doctor(id)
);