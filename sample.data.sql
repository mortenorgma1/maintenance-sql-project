-- Insert sample equipment, maintenance, and failure records, then normalize maintenance_type values for consistency (e.g., standardize "corrective" to "Corrective").

insert into equipment
values (1, 'crusher A', 'crusher', '2020-05-10')


insert into maintenance_logs
values(1,1,'2024-01-05','corrective',6.5)


insert into failures
values(1,1,'2024-01-05','Bearing Failure')

-- Data normalization
UPDATE maintenance_logs
SET maintenance_type = 'Corrective'
WHERE lower(maintenance_type) = 'corrective';

