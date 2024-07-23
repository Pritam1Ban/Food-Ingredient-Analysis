# Food-Ingredient-Analysis

This project involves analyzing a dataset consisting of Food Ingredients. There are 38 features available in this dataset with around 2500+ rows. 
Since this is a small dataset, using Excel for exploring the data would have been easier. But, I tried to explore it using Power BI. 
Maybe in future python too.
Features are described separately in a file "ingredients.pdf" I've uploaded.

# Steps Taken:
1. Data Importation: The dataset is in simple .csv format. So I have simply importe it using Power BI's Import feature. 
2. Data Proprocessing and Creating Data models: Now, onto the data itself. After carefully analyzing the dataset, there was not null value found.
   Now, there was a slight error showing while loading the dataset as there were different column ware shown (e.g., column1, column2, etc.)
   in a separate row. So, I went to the "Transform" > "Power Query" > "Transform Column" > "Show First Row as Headers" to make the extra column
   disappear.  
3. EDA: During the EDA I mostly took help of the "Cards" and "Stacked Chart" for Visualization. The questions I was trying to explore were,
         A. Top 10 Categories having Carbohydrates,
         B. Top 10 Categories having Fats,
         C. Top 10 Categories having Water,
         D. Top 10 Categories having Minerals,
         E. Top 10 Categories having other ingradients (Cholesterol Protein, etc.),
         F. Total No of Categories Available,
         G. Total No Ingredient Bank Counts.
4. Insights from Analysis: So, here are some insights from the analysis.
   A. Carbohydrates: Sugar, Strawberry Flavor beverage mix, Chewing Gum, Cornsterch, Sweeteners, Butter Replacement, Tapoica, Fruit Syrup,
                     Potato Falvor - these are top 10 categories that coems with High amount of Carbohydrates, ranging from
                     83.10 mg to 99.15 mg.
   B. Protein: Soy protein isolate, Gelatins, Peanut Flour, Protein Supplement, Soy Flour, Bacon Bits, Game Meats, etc. are among top 10
               product categories with high protein level. On average, 28.38 mg - 88.32 mg is the range.
   C. Minerals: Calcium (101.36mg), Copper (0.19mg Avg), Iron (3.06mg Avg), magnasium (37.81mg Avg), Phosphorus (158.77mg Avg),
                Potassium (277.49mg Avg), Sodium (356.74mg Avg), Zinc 1.76mg Avg)- these are the minerals available in the dataset.

   
                 
