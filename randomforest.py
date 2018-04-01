# -*- coding: utf-8 -*-
"""
Created on Sun Apr  1 17:46:16 2018

@author: sang-il
"""
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from sklearn.model_selection import train_test_split

file_list =['new_dataset_bakery.csv', 'new_dataset_cafe.csv', 'new_dataset_chicken.csv', 'new_dataset_chinese.csv', 
            'new_dataset_fastFood.csv', 'new_dataset_hof.csv', 'new_dataset_japanese.csv', 'new_dataset_korean.csv',
            'new_dataset_snack.csv', 'new_dataset_western.csv']

def randomforest(file_list):
    for file in file_list:
        df = pd.read_csv("%s" %file)
        label=[]
        data=[]
        for row_index, row in df.iterrows():
            label.append(row.iloc[22])
            row_data =[]
            for v in row.iloc[3:20]:
                row_data.append(v)
            data.append(row_data)
        data_train, data_test, label_train, label_test = \
        train_test_split(data, label)
        clf=RandomForestClassifier()
        clf.fit(data_train, label_train)
        predict = clf.predict(data_test)
        
        ac_score = metrics.accuracy_score(label_test, predict)
        cl_report = metrics.classification_report(label_test, predict)
        print("%s의 정답률 =" %file, ac_score)
        print("%s의 리포트 = \n" %file, cl_report)