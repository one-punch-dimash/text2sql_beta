CREATE DATABASE IF NOT EXISTS marketing_agency;

USE marketing_agency;

CREATE TABLE IF NOT EXISTS Website (
    visit_id UInt64,
    visit_location String,
    visit_date Date
) ENGINE = MergeTree()
ORDER BY (visit_date);

INSERT INTO Website
SELECT
    toUInt64(concat(toString(rand64()), toString(number % 100000000))) AS visit_id,
    cities[(number % 10) + 1] AS visit_location,
    toDate('2022-01-01') + toIntervalDay((number + rand()) % 730) AS visit_date
FROM system.numbers
LIMIT 100;

CREATE TABLE IF NOT EXISTS Customer_payments (
    invoice_id UInt64,
    customer_id String,
    payment_amount Float64,
    invoice_date Date
) ENGINE = MergeTree()
ORDER BY (invoice_date);

INSERT INTO Customer_payments
SELECT
    toUInt64(concat(toString(rand64()), toString(number % 100000000))) AS invoice_id,
    toString((number % 100000000) + 100000000) AS customer_id,
    (number % 1000) + 100 AS payment_amount,
    toDate('2022-01-01') + toIntervalDay((number + rand()) % 730) AS invoice_date
FROM system.numbers
LIMIT 100;

CREATE TABLE IF NOT EXISTS Platform (
    platform_name String,
    ad_name String,
    daily_clicks UInt32,
    date Date,
    ad_cost Float64
) ENGINE = MergeTree()
ORDER BY (date);

INSERT INTO Platform
SELECT
    platforms[(number % 4) + 1] AS platform_name,
    concat('Ad', toString(number)) AS ad_name,
    (number % 100) AS daily_clicks,
    toDate('2022-01-01') + toIntervalDay((number + rand()) % 730) AS date,
    ((number % 50) + 1) * 10 AS ad_cost
FROM system.numbers
LIMIT 100;
