COPY dividend(company, fiscal_year)
FROM '.\test_data.txt'
DELIMITER ','
CSV HEADER;