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

print(np.isinf(boston_df).sum())

boston_df.fillna(boston_df.median(), inplace=True)

# Replace infinity with NaN
boston_df.replace([np.inf, -np.inf], np.nan, inplace=True)

# Fill those NaNs (formerly infinities) with the median value of each column
boston_df.fillna(boston_df.median(), inplace=True)

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
# plt.show()

# Select features and target variable
features = ['CRIM', 'ZN', 'INDUS', 'CHAS', 'NOX', 'RM', 'AGE', 'DIS', 'RAD', 'TAX', 'PTRATIO', 'B', 'LSTAT']
X = boston_df[features]
y = boston_df['PRICE']

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2,random_state=42)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.fit_transform(X_test)

model = LinearRegression()
model.fit(X_train,y_train)

y_pred = model.predict(X_test)

mse = mean_squared_error(y_test,y_pred)
print(f'Mean Sqaure error : {mse}')
r2_s = r2_score(y_test,y_pred)
print(f'R2 Score {r2_s}')

plt.figure(figsize=(14,10))
plt.scatter(y_test,y_pred,edgecolor='k',alpha=0.7)
plt.plot([y_test.min(),y_test.max()],[y_test.min(),y_test.max()],'r--',lw = 3)
plt.xlabel('Actual')
plt.ylabel('Predicted')
plt.title('Actual vs Predicted House Prices')
plt.show()

