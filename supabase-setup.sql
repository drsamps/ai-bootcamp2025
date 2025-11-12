-- Create leaderboard table for Animal Memory Game
CREATE TABLE IF NOT EXISTS leaderboard (
    id BIGSERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    score INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index for faster sorting by score
CREATE INDEX IF NOT EXISTS idx_leaderboard_score ON leaderboard(score ASC);

-- Enable Row Level Security
ALTER TABLE leaderboard ENABLE ROW LEVEL SECURITY;

-- Create policy to allow anyone to read leaderboard
CREATE POLICY "Anyone can read leaderboard"
    ON leaderboard
    FOR SELECT
    USING (true);

-- Create policy to allow anyone to insert scores
CREATE POLICY "Anyone can insert scores"
    ON leaderboard
    FOR INSERT
    WITH CHECK (true);

-- Display confirmation
SELECT 'Leaderboard table created successfully!' as message;
