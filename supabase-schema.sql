-- Script SQL initial pour Supabase (PostgreSQL)
-- Projet : Smart-Collect

-- 1. Table des Utilisateurs (Rôles : Collecteur, Administrateur, Citoyen)
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(100),
    role VARCHAR(50) DEFAULT 'user',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Table des Bacs / Points de collecte (Smart Bins)
CREATE TABLE IF NOT EXISTS bins (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    location_lat DECIMAL(9,6) NOT NULL,
    location_lng DECIMAL(9,6) NOT NULL,
    fill_level INT DEFAULT 0, -- Niveau de remplissage en %
    status VARCHAR(50) DEFAULT 'active', -- active, full, maintenance
    last_reported TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 3. Table de l'historique des Collectes
CREATE TABLE IF NOT EXISTS collections (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bin_id UUID REFERENCES bins(id) ON DELETE CASCADE,
    collector_id UUID REFERENCES users(id) ON DELETE SET NULL,
    collected_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    weight_kg DECIMAL(6,2)
);

-- Index pour optimiser les requêtes fréquentes
CREATE INDEX IF NOT EXISTS idx_bins_status ON bins(status);
CREATE INDEX IF NOT EXISTS idx_collections_bin ON 
