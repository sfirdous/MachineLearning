#!/usr/bin/env python
# coding: utf-8



#import the necessary libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#set the style of the plot
sns.set(style = "whitegrid")




#load the dataframe
titanic_data = pd.read_csv('titanic.csv')



#data cleaning
#1.Inspecting the data

#displaying first few rows of dataset
print(titanic_data.head())

#displaying the summary
print(titanic_data.info)

#checking for null values
print(titanic_data.isnull().sum())



#2.handling missing values
titanic_data['Age'].fillna(titanic_data['Age'].median(),inplace = True)

titanic_data['Embarked'].fillna(titanic_data['Embarked'].mode()[0],inplace = True)

# titanic_data.drop(columns = ['Cabin'],inplace = True)

titanic_data.dropna(subset=['Fare'],inplace = True)


#3.Correcting DataTypes
#converting 'Survived' and 'Pclass' to categorial
titanic_data['Survived'] = titanic_data['Survived'].astype('category')
titanic_data['Pclass'] = titanic_data['Pclass'].astype('category')


#4.Expolatory Data Analysis (EDA)

#a.Distribution of Numerical Features:
titanic_data.hist(bins = 20,figsize=(14,10))
plt.show()

#b.Count Plot for Categorical Features
plt.figure(figsize=(14,6))
plt.subplot(1,2,1)
sns.countplot(data = titanic_data,x='Survived')
plt.show()

plt.subplot(1,2,1)
sns.countplot(data = titanic_data,x='Pclass')
plt.show()

#c.Survival Rate by Passenger Class
titanic_data['Survived'] = titanic_data['Survived'].astype(int)
titanic_data['Pclass'] = titanic_data['Pclass'].astype(int)

plt.figure(figsize=(8, 6))
sns.barplot(data=titanic_data, x='Pclass', y='Survived')
plt.title('Survival Rate by Passenger Class')
plt.show()

#d.Survival Rate by Sex
plt.figure(figsize=(8,6))
sns.barplot(data = titanic_data , x = 'Sex',y = 'Survived')
plt.title('Survuval Rate by Sex')
plt.show()

#e.Age distribution by survival
plt.figure(figsize=(8,6))
sns.histplot(data=titanic_data,x='Age',hue='Survived',multiple = 'stack',bins = 30)
plt.title('Age Distribution by Survival')
plt.show()

#f.Correlation Matrix
plt.figure(figsize=(8,4))
sns.heatmap(titanic_data.corr(),annot = True,cmap='coolwarm',fmt = '.2f')
plt.title('Correlation Matrix')
plt.show()