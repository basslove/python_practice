CREATE DATABASE IF NOT EXISTS py_sampledb_staging;
CREATE DATABASE IF NOT EXISTS py_sampledb_development;

GRANT ALL PRIVILEGES ON *.* TO 'sample'@'%';