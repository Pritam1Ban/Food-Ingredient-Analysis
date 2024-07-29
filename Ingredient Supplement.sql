Select * From ingredients_supplements;

Select COUNT(DISTINCT(Category)) as Count_Of_Product FROM ingredients_supplements;

Select Category, COUNT(Category) as Total_Count From ingredients_supplements
GROUP BY Category ORDER BY COUNT(Category) DESC LIMIT 25;

SELECT Category, ROUND(AVG(Protein), 2) AS AverageProtein
FROM ingredients_supplements
GROUP BY Category Order BY AverageProtein DESC LIMIT 10;

SELECT Category, ROUND(MAX(Protein), 2) AS MAXProtein
FROM ingredients_supplements
GROUP BY Category Order BY MAXProtein DESC LIMIT 10;

SELECT Category, ROUND(AVG(Carbohydrate), 2) AS AverageProtein
FROM ingredients_supplements
GROUP BY Category Order BY AverageProtein DESC LIMIT 10;

SELECT Category, ROUND(AVG(Water), 2) AS AverageProtein
FROM ingredients_supplements
GROUP BY Category Order BY AverageProtein DESC LIMIT 10;

SELECT Category,  COUNT(Category) as Cat_Count,  Nutrient_Data_Bank_Number, ROUND(AVG(Vitamin_C), 2) as AVGVit_C 
FROM ingredients_supplements 
GROUP BY COUNT(Category) 
ORDER BY AVGVit_C DESC
LIMIT 10;

SELECT Category, ROUND(SUM(Cholesterol)) as TotalCholesterol, COUNT(Category) as Available_Categories
FROM ingredients_supplements
WHERE Cholesterol > (Select AVG(Protein) 
FROM ingredients_supplements) Group By Category 
ORDER BY Available_Categories DESC LIMIT 10;

Select COUNT(Category) from ingredients_supplements;

SELECT Category, ROUND(SUM(Carbohydrate), 2) AS TotalCarbohydrates, ROUND(AVG(Carbohydrate), 2) as AVGCarbohydrate, 
ROUND(MAX(Carbohydrate), 2) as MAXCarbohydrate, COUNT(Category) as Available_Categories
FROM ingredients_supplements GROUP BY Category ORDER BY Available_Categories DESC LIMIT 10;

SELECT Category, COUNT(Category) as Available_Category, 
ROUND(SUM(Cholesterol), 2) as Total_Chol, ROUND(SUM(Sugar_Total), 2) as Total_Sugar,
ROUND((AVG(Cholesterol)/AVG(Sugar_Total)), 2) as CholVSSugar
FROM ingredients_supplements
GROUP BY Category ORDER BY CholVSSugar DESC LIMIT 10;

SELECT Category, COUNT(Category) as Available_Category, 
ROUND(SUM(Carbohydrate), 2) as Total_Carb, ROUND(SUM(Protein), 2) as Total_Prt, 
ROUND((SUM(Total_Lipid) + SUM(Monosaturated_Fat) + SUM(Polysaturated_Fat) + SUM(Saturated_Fat)), 2) as Total_Fat 
FROM ingredients_supplements GROUP BY Category
ORDER BY COUNT(Category) DESC LIMIT 10;

SELECT Category, COUNT(Category) as Available_Category, 
ROUND((SUM(Vitamin_B12) + SUM(Vitamin_B6) + SUM(Vitamin_A_RAE) +
SUM(Vitamin_C) + SUM(Vitamin_E) + SUM(Vitamin_K)), 2) as Total_Vit,
ROUND((SUM(Major_Minerals_Calcium) + SUM(Major_Minerals_Copper) + SUM(Major_Minerals_Iron) + 
SUM(Major_Minerals_Magnesium) + SUM(Major_Minerals_Phosphorus) + SUM(Major_Minerals_Sodium) 
+ SUM(Major_Minerals_Zinc)), 2) as Total_Minerals 
FROM ingredients_supplements GROUP BY Category
ORDER BY COUNT(Category) DESC LIMIT 10;

# top 5 food supplements with the highest protein content, along with their categories

WITH ProteinRanking AS (
    SELECT Category, Protein, RANK() OVER (ORDER BY Protein DESC) AS ProteinRank
    FROM ingredients_supplements
)
SELECT Category, Protein
FROM ProteinRanking
WHERE ProteinRank <= 5;

# the average and standard deviation of vitamin C content for each category.

WITH VitaminCStats AS (
    SELECT Category, Round(AVG(Vitamin_C), 2) AS AvgVitaminC, ROUND(STDDEV(Vitamin_C),2 ) AS StdDevVitaminC
    FROM ingredients_supplements
    GROUP BY Category
)
SELECT * FROM VitaminCStats GROUP BY Category ORDER BY AvgVitaminC DESC;

# food supplements with a higher than average protein content and a lower than average fat content.

WITH ProteinAverage AS (
    SELECT AVG(Protein) AS AvgProtein
    FROM ingredients_supplements
),
CarbAverage AS (
    SELECT ROUND(AVG(Carbohydrate), 2) AS AvgCarb
    FROM ingredients_supplements
)
SELECT Category, CarbAverage, ProteinAverage 
FROM ingredients_supplements
WHERE Protein > (SELECT Avg(Protein) FROM ProteinAverage)
AND Carbohydrate < (SELECT AVG(Carbohydrate) FROM CarbAverage);

WITH CarbRanking AS (
    SELECT Category, Carbohydrate,
           ROW_NUMBER() OVER (ORDER BY Carbohydrate) AS RowNum
    FROM ingredients_supplements
)
SELECT Category, Carbohydrate, ROUND(SUM(Carbohydrate) OVER (ORDER BY RowNum), 2) AS CumulativeCarbohydrate
FROM CarbRanking ORDER BY CumulativeCarbohydrate DESC;

# SHOW VARIABLES LIKE "secure_file_priv";





