# -*- coding: utf-8 -*-
"""
Created on Fri Mar 30 13:55:32 2018

@author: sang-il
"""
import pandas as pd

file_list =['dataset_bakery.csv', 'dataset_cafe.csv', 'dataset_chicken.csv', 'dataset_chinese.csv', 
            'dataset_fastFood.csv', 'dataset_hof.csv', 'dataset_japanese.csv', 'dataset_korean.csv',
            'dataset_snack.csv', 'dataset_western.csv']

del_list =['areaName', 'serviceName', '1NearSurvival', '2NearSurvival', '3NearSurvival', '5NearSurvival',
           '5uNearSurvival', '1Survival', '2Survival', '3Survival', '5Survival', '5uSurvival']

def make_sales_z(file_list, del_list):
    for filename in file_list:
        df = pd.read_csv(filename)
        for columns in del_list:
            del df[columns]
        df = df[['date', 'areaCode', 'serviceCode', 'totalNearStore', 'totalStore',
       'avgNearMonth', 'nearSales', 'numberOfNearSales', 'avgMonth',
       'numberOfSales', 'totalPeople', 'totalNearPeople', 'totalBizman',
       'totalNearBizman', 'totalLivingPeople', 'avgIncome', 'avgOutcome',
       'avgNearIcome', 'avgNearOutcome', 'totalFacility', 'totalNearFacility', 'sales']]
        df = df.drop(df['sales']>(df['sales'].mean()+(1.5*df['sales'].std())))
        original = df['sales']
        std = df['sales'].std()
        mean = df['sales'].mean()
        new_z = (original - mean)/std
        df['sales'] = new_z
        df = df.reset_index()
        del df['index']
        tmp=[]
        for sales in df['sales']:
            if sales < -1:
                sales = 'Bad'
            elif -1 <= sales < 0 :
                sales = 'Not_Good'
            elif 0 <= sales < 1 :
                sales= 'Good'
            else :
                sales= 'Very_Good'
            tmp.append(sales)
        df['divide']=tmp
        print('%s' %filename , '성공')
        df.to_csv("new_%s" %filename ,encoding='utf-8',header = True, index = False )
    

