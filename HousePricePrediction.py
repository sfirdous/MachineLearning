#step1.importing libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error,r2_score
from sklearn.preprocessing import StandardScaler
import seaborn as sns



#step2.load and inspect the dataset
boston_df = pd.read_csv('HousingData.csv')
boston_df['PRICE'] = boston_df['MEDV']

#print first rows od dataset
print(boston_df.head())

#print the description of dataset
print(boston_df.info())

#checking for missing values
print(boston_df.isnull().sum())

#step3.Exporatory Data Analysis
#summary
print(boston_df.describe())

#histogram for numerical feature
boston_df.hist(bins = 20,figsize = (14,10))
plt.show()

#visulizing the relationship
sns.pairplot(boston_df)
plt.show()

#calculaing the correlation
correlation_matrix = boston_df.corr()
sns.heatmap(correlation_matrix,annot = True,cmap='coolwarm',fmt='.2f')
plt.show()

