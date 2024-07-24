SELECT table_name, column_name, data_type, data_length, nullable, data_default
FROM user_tab_columns
WHERE table_name IN ('AIRCRAFT', 'AIRLINES', 'AIRPORTS', 'BOOKINGS', 'CREWMEMBERS', 'FLIGHTS', 'PASSENGERS');
