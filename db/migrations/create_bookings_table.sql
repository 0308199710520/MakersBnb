CREATE TABLE bookings(id SERIAL PRIMARY KEY);
ALTER TABLE bookings ADD COLUMN check_in VARCHAR(20);
ALTER TABLE bookings ADD COLUMN check_out VARCHAR(20);
ALTER TABLE bookings ADD COLUMN user_id TEXT;
ALTER TABLE bookings ADD COLUMN listing_id TEXT;