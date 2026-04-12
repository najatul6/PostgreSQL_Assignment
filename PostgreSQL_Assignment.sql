-- ============================================================
-- Wildlife Conservation Monitoring - Assignment
-- ============================================================
 
 
-- ============================================================
-- TABLE CREATE
-- ============================================================

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    region    VARCHAR(100) NOT NULL
)

CREATE TABLE species (
    species_id          SERIAL PRIMARY KEY,
    common_name         VARCHAR(100) NOT NULL,
    scientific_name     VARCHAR(150) NOT NULL,
    discovery_date      DATE NOT NULL,
    conservation_status VARCHAR(50) DEFAULT 'N/A'
);

CREATE TABLE sightings (
    sighting_id   SERIAL PRIMARY KEY,
    ranger_id     INT NOT NULL REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id    INT NOT NULL REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    location      VARCHAR(150) NOT NULL,
    notes         TEXT
);