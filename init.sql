CREATE TABLE sample_accession (
    id SERIAL PRIMARY KEY,
    sample_barcode VARCHAR(50) UNIQUE NOT NULL,
    patient_id VARCHAR(50) NOT NULL,
    test_type VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'RECEIVED',
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sample_accession (sample_barcode, patient_id, test_type) VALUES
('BARCODE-001', 'PATIENT-ABC', 'COVID-19 PCR'),
('BARCODE-002', 'PATIENT-XYZ', 'Wastewater Sequencing');
