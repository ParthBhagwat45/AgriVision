-- Preview the first 10 rows to verify that the dataset has been imported correctly.

SELECT *
FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `
LIMIT 10 ;


-- Count the total number of records in the dataset.

SELECT COUNT(*)
FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data ` ;


-- Exclude the unnecessary index column from the analysis.

SELECT * EXCEPT(int64_field_0)
FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data ` ;


-- Check each column for missing values.

SELECT
COUNTIF(State_Name IS NULL) AS State_Name_NULLS,
COUNTIF(Crop_Type IS NULL) AS Crop_Type_NULLS,
COUNTIF(Crop IS NULL) AS Crop_NULLS,
COUNTIF(N IS NULL) AS N_NULLS,
COUNTIF(P IS NULL) AS P_NULLS,
COUNTIF(K IS NULL) AS K_NULLS,
COUNTIF(pH IS NULL) AS pH_NULLS,
COUNTIF(rainfall IS NULL) AS Rainfall_NULLS,
COUNTIF(temperature IS NULL) AS Temperature_NULLS,
COUNTIF(Area_in_hectares IS NULL) AS Area_NULLS,
COUNTIF(Production_in_tons IS NULL) AS Production_NULLS,
COUNTIF(Yield_ton_per_hec IS NULL) AS Yield_NULLS

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Check for duplicate records across all columns.

SELECT
    State_Name,
    Crop_Type,
    Crop,
    N,
    P,
    K,
    pH,
    rainfall,
    temperature,
    Area_in_hectares,
    Production_in_tons,
    Yield_ton_per_hec,
    COUNT(*) AS duplicate_count

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY
    State_Name,
    Crop_Type,
    Crop,
    N,
    P,
    K,
    pH,
    rainfall,
    temperature,
    Area_in_hectares,
    Production_in_tons,
    Yield_ton_per_hec

HAVING COUNT(*) > 1;


-- Obtain summary statistics and quartiles for rainfall and temperature.

SELECT
    MIN(rainfall) AS Min_Rainfall,
    MAX(rainfall) AS Max_Rainfall,
    AVG(rainfall) AS Avg_Rainfall,
    APPROX_QUANTILES(rainfall,4) AS Rainfall_Quartiles,

    MIN(temperature) AS Min_Temperature,
    MAX(temperature) AS Max_Temperature,
    AVG(temperature) AS Avg_Temperature,
    APPROX_QUANTILES(temperature,4) AS Temperature_Quartiles

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Check for zero or negative production values.

SELECT COUNT(*) AS Production_Zero_Or_Negative

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

WHERE Production_in_tons <= 0;


-- Check for zero or negative yield values.

SELECT COUNT(*) AS Yield_Zero_Or_Negative

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

WHERE Yield_ton_per_hec <= 0;


-- Check for zero or negative cultivated area values.

SELECT COUNT(*) AS Area_Zero_Or_Negative

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

WHERE Area_in_hectares <= 0;


-- Create soil type, rainfall level and temperature level categories
-- for easier analysis and visualization.

SELECT *,

CASE
    WHEN pH < 7 THEN "Acidic"
    WHEN pH = 7 THEN "Neutral"
    WHEN pH > 7 THEN "Basic"
END AS Soil_type,

CASE
    WHEN temperature <= 23.1 THEN "Low"
    WHEN temperature <=27.3 THEN "Moderate"
    WHEN temperature <= 29.3 THEN "High"
    ELSE "Very High"
END AS temperature_level,

CASE
    WHEN rainfall <= 157 THEN "Low"
    WHEN rainfall <=580 THEN "Moderate"
    WHEN rainfall <= 1111 THEN "High"
    ELSE "Very High"
END AS rainfall_level

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;

-- Calculate the total agricultural production for each state.

SELECT
    State_Name,
    SUM(Production_in_tons) AS Total_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY State_Name
ORDER BY Total_Production DESC;


-- Calculate the total agricultural production for each crop.

SELECT
    Crop,
    SUM(Production_in_tons) AS Total_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Crop
ORDER BY Total_Production DESC;


-- Calculate the total agricultural production for each crop type.

SELECT
    Crop_Type,
    SUM(Production_in_tons) AS Total_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Crop_Type
ORDER BY Total_Production DESC;


-- Calculate the average crop yield for each state.

SELECT
    State_Name,
    AVG(Yield_ton_per_hec) AS Average_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY State_Name
ORDER BY Average_Yield DESC;


-- Calculate the average crop yield for each crop.

SELECT
    Crop,
    AVG(Yield_ton_per_hec) AS Average_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Crop
ORDER BY Average_Yield DESC;


-- Calculate the average crop yield for each crop type.

SELECT
    Crop_Type,
    AVG(Yield_ton_per_hec) AS Average_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Crop_Type
ORDER BY Average_Yield DESC;


-- Calculate the total cultivated area for each state.

SELECT
    State_Name,
    SUM(Area_in_hectares) AS Total_Area

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY State_Name
ORDER BY Total_Area DESC;


-- Calculate the total cultivated area for each crop.

SELECT
    Crop,
    SUM(Area_in_hectares) AS Total_Area

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Crop
ORDER BY Total_Area DESC;


-- Calculate the correlation between rainfall and agricultural production.

SELECT
    CORR(rainfall, Production_in_tons) AS Rainfall_vs_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between rainfall and crop yield.

SELECT
    CORR(rainfall, Yield_ton_per_hec) AS Rainfall_vs_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between temperature and agricultural production.

SELECT
    CORR(temperature, Production_in_tons) AS Temperature_vs_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between temperature and crop yield.

SELECT
    CORR(temperature, Yield_ton_per_hec) AS Temperature_vs_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Compare the average production across different rainfall categories.

SELECT

CASE
    WHEN rainfall <= 157 THEN 'Low'
    WHEN rainfall <= 580 THEN 'Moderate'
    WHEN rainfall <= 1111 THEN 'High'
    ELSE 'Very High'
END AS Rainfall_Level,

AVG(Production_in_tons) AS Avg_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Rainfall_Level
ORDER BY Avg_Production DESC;


-- Compare the average crop yield across different rainfall categories.

SELECT

CASE
    WHEN rainfall <= 157 THEN 'Low'
    WHEN rainfall <= 580 THEN 'Moderate'
    WHEN rainfall <= 1111 THEN 'High'
    ELSE 'Very High'
END AS Rainfall_Level,

AVG(Yield_ton_per_hec) AS Avg_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Rainfall_Level
ORDER BY Avg_Yield DESC;


-- Compare the average production across different temperature categories.

SELECT

CASE
    WHEN temperature <= 23.1 THEN 'Low'
    WHEN temperature <= 27.3 THEN 'Moderate'
    WHEN temperature <= 29.3 THEN 'High'
    ELSE 'Very High'
END AS Temperature_Level,

AVG(Production_in_tons) AS Avg_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Temperature_Level
ORDER BY Avg_Production DESC;


-- Compare the average crop yield across different temperature categories.

SELECT

CASE
    WHEN temperature <= 23.1 THEN 'Low'
    WHEN temperature <= 27.3 THEN 'Moderate'
    WHEN temperature <= 29.3 THEN 'High'
    ELSE 'Very High'
END AS Temperature_Level,

AVG(Yield_ton_per_hec) AS Avg_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Temperature_Level
ORDER BY Avg_Yield DESC;

-- Compare the average production across different soil types.

SELECT

CASE
    WHEN pH < 7 THEN 'Acidic'
    WHEN pH = 7 THEN 'Neutral'
    ELSE 'Basic'
END AS Soil_Type,

AVG(Production_in_tons) AS Avg_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Soil_Type
ORDER BY Avg_Production DESC;


-- Compare the average crop yield across different soil types.

SELECT

CASE
    WHEN pH < 7 THEN 'Acidic'
    WHEN pH = 7 THEN 'Neutral'
    ELSE 'Basic'
END AS Soil_Type,

AVG(Yield_ton_per_hec) AS Avg_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY Soil_Type
ORDER BY Avg_Yield DESC;


-- Calculate the correlation between soil pH and agricultural production.

SELECT
    CORR(pH, Production_in_tons) AS pH_vs_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between soil pH and crop yield.

SELECT
    CORR(pH, Yield_ton_per_hec) AS pH_vs_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between nitrogen content and agricultural production.

SELECT
    CORR(N, Production_in_tons) AS N_vs_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between nitrogen content and crop yield.

SELECT
    CORR(N, Yield_ton_per_hec) AS N_vs_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between phosphorus content and agricultural production.

SELECT
    CORR(P, Production_in_tons) AS P_vs_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between phosphorus content and crop yield.

SELECT
    CORR(P, Yield_ton_per_hec) AS P_vs_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between potassium content and agricultural production.

SELECT
    CORR(K, Production_in_tons) AS K_vs_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Calculate the correlation between potassium content and crop yield.

SELECT
    CORR(K, Yield_ton_per_hec) AS K_vs_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `;


-- Identify the top state-crop combinations by total agricultural production.

SELECT
    State_Name,
    Crop,
    SUM(Production_in_tons) AS Total_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY
    State_Name,
    Crop

ORDER BY Total_Production DESC

LIMIT 20;


-- Identify the top state-crop combinations by average crop yield.

SELECT
    State_Name,
    Crop,
    AVG(Yield_ton_per_hec) AS Avg_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY
    State_Name,
    Crop

ORDER BY Avg_Yield DESC

LIMIT 20;


-- Compare total agricultural production across state and crop type combinations.

SELECT
    State_Name,
    Crop_Type,
    SUM(Production_in_tons) AS Total_Production

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY
    State_Name,
    Crop_Type

ORDER BY Total_Production DESC;


-- Compare the average crop yield across state and crop type combinations.

SELECT
    State_Name,
    Crop_Type,
    AVG(Yield_ton_per_hec) AS Avg_Yield

FROM `project-e8aaa25e-6b7c-4144-a86.crop_production.crop_production_data `

GROUP BY
    State_Name,
    Crop_Type

ORDER BY Avg_Yield DESC;