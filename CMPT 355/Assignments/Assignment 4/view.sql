/* Matthew Mulenga */
/* mam558 */
/* 11144528 */

CREATE OR REPLACE VIEW report_view (
  employee_number,
  title,
  first_name,
  middle_name,
  last_name,
  gender,
  birthdate,
  marital_status,
  ssn,
  home_email,
  orig_hire_date,
  rehire_date,
  term_date,
  term_type,
  term_reason,
  job_title,
  job_code,
  job_st_date,
  job_end_date,
  department_code,
  location_code,
  pay_freq,
  pay_type,
  hourly_amount,
  salary_amount,
  supervisor_job_code,
  employee_status,
  standard_hours,
  employee_type,
  employment_status,
  last_perf_num,
  last_perf_text ,
  last_perf_date,
  home_street_num,
  home_street_addr,
  home_street_suffix,
  home_city,
  home_state,
  home_country,
  home_zip_code,
  bus_street_num,
  bus_street_addr,
  bus_street_suffix,
  bus_zip_code,
  bus_city,
  bus_state,
  bus_country,
  ph1_cc,
  ph1_area,
  ph1_number,
  ph1_extension,
  ph1_type,
  ph2_cc,
  ph2_area,
  ph2_number,
  ph2_extension,
  ph2_type,
  ph3_cc,
  ph3_area,
  ph3_number,
  ph3_extension,
  ph3_type,
  ph4_cc,
  ph4_area,
  ph4_number,
  ph4_extension,
  ph4_type)
  AS
  SELECT
    e.employee_number AS emplid,
    e.title,
    e.first_name AS firstName,
    e.middle_name AS middleName,
    e.last_name AS lastName,
    e.gender,
    e.birth_date AS birthdate,
    m.name AS maritalStatus,
    e.ssn AS SSN,
    e.home_email AS homeEmail,
    e.hire_date AS OrigHireDate,
    e.rehire_date AS rehireDate,
    e.termination_date AS termDate,
    tt.name AS termType,
    tr.name AS termReason,
    j.name AS jobTitle,
    j.code AS jobCode,
    j.effective_date AS jobStartDt,
    j.expiry_date AS jobEndDt,
    d.code AS departmentCode,
    l.code AS locationCode,
    pf.name AS payFreq,
    pt.name AS payType,
    ej.pay_amount AS hourlyAmount,
    ej.pay_amount AS salaryAmount,
    su.code AS supervisorJobCode,
    es.name AS employeeStatus,
    ej.standard_hours AS standardHours,
    et.name AS employeeType,
    est.name AS employmentStatusType,
    rr.id AS lastPerformanceRating,
    rr.review_text AS lastPerformanceRatingText,
    er.review_date AS lastPerformanceRatingDate,
    (SELECT SUBSTRING(emp_address.street, '^([\w\-]+)')) AS homeStreetNum,
    (SELECT SUBSTRING(emp_address.street, '(?<= )(.*)(?= )')) AS homeStreetName,
    (SELECT SUBSTRING(emp_address.street, '\s([\w\-]+)$')) AS homeStreetSuffix,
    emp_address.city AS homeCity,
    emp_prov.name AS homeState,
    emp_country.name AS homeCountry,
    emp_address.postal_code AS homeZipCode,
    (SELECT SUBSTRING(bus_address.street, '^([\w\-]+)')) AS busStreetNum,
    (SELECT SUBSTRING(bus_address.street, '(?<= )(.*)(?= )')) AS busStreetName,
    (SELECT SUBSTRING(bus_address.street, '\s([\w\-]+)$')) AS busStreetSuffix,
    bus_address.postal_code AS busZipCode,
    bus_address.city AS busCity,
    bus_prov.name AS busState,
    bus_country.name AS busCountry,
    (SELECT p.country_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 0) AS phone1CountryCode,
    (SELECT p.area_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 0) AS phone1AreaCode,
    (SELECT p.ph_number FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 0) AS phone1Number,
    (SELECT p.extension FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 0) AS phone1Extension,
    (SELECT pt.name FROM phone_types pt, phone_numbers p  WHERE pt.id = p.type_id AND p.employee_id = e.id LIMIT 1 OFFSET 0) AS phone1Type,
    (SELECT p.country_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 1) AS phone2CountryCode,
    (SELECT p.area_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 1) AS phone2AreaCode,
    (SELECT p.ph_number FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 1) AS phone2Number,
    (SELECT p.extension FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 1) AS phone2Extension,
    (SELECT pt.name FROM phone_types pt, phone_numbers p  WHERE pt.id = p.type_id AND p.employee_id = e.id LIMIT 1 OFFSET 1) AS phone2Type,
    (SELECT p.country_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 2) AS phone3CountryCode,
    (SELECT p.area_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 2) AS phone3AreaCode,
    (SELECT p.ph_number FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 2) AS phone3Number,
    (SELECT p.extension FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 2) AS phone3Extension,
    (SELECT pt.name FROM phone_types pt, phone_numbers p  WHERE pt.id = p.type_id AND p.employee_id = e.id LIMIT 1 OFFSET 3) AS phone3Type,
    (SELECT p.country_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 3) AS phone4CountryCode,
    (SELECT p.area_code FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 3) AS phone4AreaCode,
    (SELECT p.ph_number FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 3) AS phone4Number,
    (SELECT p.extension FROM phone_numbers p WHERE p.employee_id = e.id LIMIT 1 OFFSET 3) AS phone4Extension,
    (SELECT pt.name FROM phone_types pt, phone_numbers p  WHERE pt.id = p.type_id AND p.employee_id = e.id LIMIT 1 OFFSET 4) AS phone4Type
    FROM employees e
    JOIN marital_statuses m ON e.marital_status_id = m.id
    JOIN employee_jobs ej ON ej.employee_id = e.id
    JOIN employee_statuses es ON ej.employee_status_id = es.id
    JOIN jobs j ON ej.job_id = j.id
    JOIN employee_types et ON ej.employee_type_id = et.id
    JOIN departments d ON j.department_id = d.id
    JOIN locations l ON d.location_id = l.id
    JOIN pay_frequencies pf ON j.pay_frequency_id = pf.id
    JOIN pay_types pt ON j.pay_type_id = pt.id
    JOIN employee_reviews er ON er.employee_id = e.id
    JOIN review_ratings rr ON er.rating_id = rr.id
    JOIN emp_addresses emp_address ON emp_address.employee_id = e.id AND emp_address.type_id = '1'
    JOIN emp_addresses bus_address ON bus_address.employee_id = e.id AND bus_address.type_id = '2'
    JOIN provinces emp_prov ON emp_address.province_id = emp_prov.id
    JOIN provinces bus_prov ON bus_address.province_id = bus_prov.id
    JOIN countries emp_country ON emp_address.country_id = emp_country.id
    JOIN countries bus_country ON bus_address.country_id = bus_country.id
    LEFT JOIN employment_status_types est ON e.employment_status_id = est.id
    LEFT JOIN termination_reasons tr ON e.term_reason_id = tr.id
    LEFT JOIN termination_types tt ON e.term_type_id = tt.id
    LEFT JOIN jobs su ON j.supervisor_job_id = su.id;
