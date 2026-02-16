-- Ari Harrison Personal Site — Supabase Schema
-- Run this in your Supabase SQL Editor

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- WRITINGS (Blog Posts)
-- ============================================
CREATE TABLE public.writings (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    published_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    excerpt TEXT,
    body TEXT,
    is_published BOOLEAN DEFAULT FALSE,
    external_url TEXT  -- Optional: link to external publication
);

-- Enable RLS but allow public read access for published posts
ALTER TABLE public.writings ENABLE ROW LEVEL SECURITY;

-- Anyone can read published writings
CREATE POLICY "Anyone can view published writings"
    ON public.writings FOR SELECT
    USING (is_published = TRUE);

-- Index for faster queries
CREATE INDEX idx_writings_published ON public.writings(is_published, published_at DESC);

-- ============================================
-- SAMPLE DATA
-- ============================================
INSERT INTO public.writings (title, slug, excerpt, body, is_published, published_at) VALUES
(
    'Why Most AI Pilots Fail: The Missing Infrastructure Layer',
    'why-most-ai-pilots-fail',
    'Reasoning is only 10% of the battle. The other 90% is the architectural "bridge" that enables reliable action in regulated domains.',
    'Full article content here...',
    TRUE,
    '2026-02-01T00:00:00Z'
),
(
    'Scaling MCP: Lessons from 100M Records',
    'scaling-mcp-lessons',
    'What changes when you shift from query-time computation to prediction infrastructure. A deep dive into sub-50ms latency for agents.',
    'Full article content here...',
    TRUE,
    '2026-01-15T00:00:00Z'
),
(
    'From Conversational to Computational AI',
    'conversational-to-computational',
    'How orchestration layers move models beyond chat interfaces and into high-stakes decision pipelines.',
    'Full article content here...',
    TRUE,
    '2025-12-10T00:00:00Z'
);
