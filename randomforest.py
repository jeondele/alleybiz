# -*- coding: utf-8 -*-
"""
Created on Sun Apr  1 22:11:24 2018

@author: sang-il
"""
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from sklearn.model_selection import train_test_split

file_list =['new_dataset_bakery.csv', 'new_dataset_cafe.csv', 'new_dataset_chicken.csv', 'new_dataset_chinese.csv', 
            'new_dataset_fastFood.csv', 'new_dataset_hof.csv', 'new_dataset_japanese.csv', 'new_dataset_korean.csv',
            'new_dataset_snack.csv', 'new_dataset_western.csv']

#업종별 csv 파일 하나의 통합 데이터프레임으로 concat
def concat_all_data(file_list):
    df = pd.DataFrame(columns=['date', 'areaCode', 'serviceCode', 'totalNearStore', 'totalStore',
       'avgNearMonth', 'nearSales', 'numberOfNearSales', 'avgMonth',
       'numberOfSales', 'totalPeople', 'totalNearPeople', 'totalBizman',
       'totalNearBizman', 'totalLivingPeople', 'avgIncome', 'avgOutcome',
       'avgNearIcome', 'avgNearOutcome', 'totalFacility', 'totalNearFacility', 'sales','divide'])
    for idx, file in enumerate(file_list):
        df_idx = pd.read_csv(file)
        df=pd.concat([df,df_idx])
    df = df[['date', 'areaCode', 'serviceCode', 'totalNearStore', 'totalStore',
       'avgNearMonth', 'nearSales', 'numberOfNearSales', 'avgMonth',
       'numberOfSales', 'totalPeople', 'totalNearPeople', 'totalBizman',
       'totalNearBizman', 'totalLivingPeople', 'avgIncome', 'avgOutcome',
       'avgNearIcome', 'avgNearOutcome', 'totalFacility', 'totalNearFacility', 'sales','divide']]
    return df

total=concat_all_data(file_list)
label=[]
data=[]

#randomforest 적용
for row_index, row in total.iterrows():
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


print("정답률 =", ac_score)
print("리포트 = \n", cl_report)