from sklearn.linear_model import LinearRegression, Ridge, Lasso
from sklearn import metrics, svm
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.preprocessing import MinMaxScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import GradientBoostingClassifier, GradientBoostingRegressor
from scipy.stats import skew
from scipy import stats
from sklearn.metrics import mean_squared_error
from sklearn.naive_bayes import GaussianNB
from sklearn.linear_model import LogisticRegression
from keras.layers import *
from keras.models import *
from keras.utils import *
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, VotingClassifier, BaggingClassifier, AdaBoostClassifier
from hdfs import InsecureClient
import os
import mysql.connector as mariadb
% matplotlib inline

client_hdfs = InsecureClient('http://10.1.41.102:50070')


##############################정확도 평가 ##############################
def rmsle(y_true, y_pred):
    assert len(y_true) == len(y_pred)
    return np.square(np.log(y_pred + 1) - np.log(y_true + 1)).mean() ** 0.5


#############################데이터 전처리 ##############################
def total_data():
    raw_file_list = ['pre_dataset_bakery.csv', 'pre_dataset_cafe.csv', 'pre_dataset_chicken.csv',
                     'pre_dataset_chinese.csv',
                     'pre_dataset_fastFood.csv', 'pre_dataset_hof.csv', 'pre_dataset_japanese.csv',
                     'pre_dataset_korean.csv',
                     'pre_dataset_snack.csv', 'pre_dataset_western.csv']

    df = pd.DataFrame(
        columns=['date', 'areaCode', 'serviceCode', 'totalNearStore', 'totalStore', 'avgNearMonth', 'nearSales',
                 'numberOfNearSales', 'avgMonth',
                 'numberOfSales', 'totalPeople', 'totalNearPeople', 'totalBizman', 'totalNearBizman',
                 'totalLivingPeople', 'avgIncome', 'avgOutcome',
                 'avgNearIcome', 'avgNearOutcome', 'totalFacility', 'totalNearFacility', 'sales'])

    for csv in raw_file_list:
        with client_hdfs.read('/user/hadoop/conf/' + csv, encoding='utf-8') as reader:
            df_read = pd.read_csv(reader)
        df = pd.concat([df, df_read])
    df = df[['date', 'areaCode', 'serviceCode', 'totalNearStore', 'totalStore',
             'avgNearMonth', 'nearSales', 'numberOfNearSales', 'avgMonth',
             'numberOfSales', 'totalPeople', 'totalNearPeople', 'totalBizman',
             'totalNearBizman', 'totalLivingPeople', 'avgIncome', 'avgOutcome',
             'avgNearIcome', 'avgNearOutcome', 'totalFacility', 'totalNearFacility', 'sales']]
    return df


# 완전 row 데이터
raw_data = total_data()
raw_data.to_csv("rd.csv")

# #쓸 자료만 추출
# raw_data = data[['date', 'areaCode', 'serviceCode', 'totalNearStore', 'totalStore',
#        'avgNearMonth', 'nearSales', 'numberOfNearSales', 'avgMonth',
#        'numberOfSales', 'totalPeople', 'totalNearPeople', 'totalBizman',
#        'totalNearBizman', 'totalLivingPeople', 'avgIncome', 'avgOutcome',
#        'avgNearIcome', 'totalFacility', 'totalNearFacility', 'sales']]
meaning_data = raw_data.iloc[:, 3:]
# object타입을 float로 변환
col_goto_change = meaning_data.dtypes[meaning_data.dtypes == "object"].index
meaning_data[col_goto_change] = meaning_data[col_goto_change].apply(lambda x: x.astype('float64', raise_on_error=False))
# #쓸 자료들 중에 왜도를 na로 바꿈
skewness = meaning_data.apply(lambda x: skew(x.dropna()))
skewed_feats = skewness[skewness > 0.75].index
# 뽑힌 feature를 log1p 적용
meaning_data[skewed_feats] = np.log1p(meaning_data[skewed_feats])
# 변수가 헷갈릴 수 있으니 logated_data로 명시
logated_data = meaning_data
# 이상치 제거된 na값들을 평균값으로 대체, 소수점 2자리까지 반영
logated_data = logated_data.fillna(logated_data.mean()).apply(lambda x: round(x, 2))

plt.figure(figsize=(15, 15))
sns.heatmap(logated_data.corr(), annot=True, cmap='summer_r', linewidths=0.2)

raw_data.iloc[:, 3:] = logated_data
# using_table = raw_data
# zip_feats = using_table[['avgNearMonth','nearSales','numberOfNearSales','avgMonth','numberOfSales','totalPeople','totalNearPeople','totalBizman','totalNearBizman','avgIncome','avgNearIcome','totalFacility','sales']]
# raw_data.iloc[:,3:] = zip_feats
raw_data = raw_data.dropna(axis=1)

x_origin = raw_data.iloc[:, 3:-1]
scaler = MinMaxScaler()
x = scaler.fit_transform(x_origin)
raw_data.iloc[:, 3:-1] = x

sales = raw_data['sales']
mean = sales.mean()
std = sales.std()
tmp = []
# top=[]
cl = []
for sale in sales:
    if sale < (mean - std):
        class_ = 'bad'
        v = 0
    elif (mean - std) <= sale < mean:
        class_ = 'not_good'
        v = 1
    elif mean <= sale < (mean + std):
        class_ = 'good'
        v = 2
    elif (mean + std) <= sale:
        class_ = 'very_good'
        v = 3
    # per_value = len(sales[sales > sale]) / len(sales)
    tmp.append(class_)
    # top.append(per_value)
    cl.append(v)

raw_data['class'] = tmp
# real_table['percent'] = top
raw_data['class_to_num'] = cl

real_table = raw_data[raw_data['date'] != 201708.0]
compare_table = raw_data[raw_data['date'] == 201708.0]

print(len(real_table[real_table['class_to_num'] == 0]) / len(real_table))
print(len(real_table[real_table['class_to_num'] == 1]) / len(real_table))
print(len(real_table[real_table['class_to_num'] == 2]) / len(real_table))
print(len(real_table[real_table['class_to_num'] == 3]) / len(real_table))

# x,y값
x = real_table.iloc[:, 3:-3]
y = real_table['class_to_num']

# c_x
c_x = compare_table.iloc[:, 3:-3]
c_y = compare_table['class_to_num']

########################GradientBoostingClassifier################################
gbc = GradientBoostingClassifier(n_estimators=10, learning_rate=1, max_depth=1, random_state=0)
gbc.fit(x, y)
gbc.score(c_x, c_y)

########################descision tree################################
# 201606~201707 데이터로 학습시키고 기존의 201708데이터의 class와 predict class를 비교
dt = DecisionTreeClassifier()
dt.fit(x, y)
dt.score(c_x, c_y)

###########################LogisticRegression#################################
lor = LogisticRegression(random_state=10)
lor.fit(x, y)
lor.score(c_x, c_y)

###########################GaussianNB#################################
nb = GaussianNB()
nb.fit(x, y)
nb.score(c_x, c_y)

###########################knn#################################
knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(x, y)
knn.score(c_x, c_y)

testAcc = []
trainAcc = []
for m in range(5, 20):
    knn = KNeighborsClassifier(n_neighbors=m, p=2, metric='minkowski')
    knn.fit(x, y)

    predY = knn.predict(c_x)
    testAcc.append((c_y == predY).sum() / len(predY))

    predY = knn.predict(x)
    testAcc.append((y == predY).sum() / len(predY))
plt.figure(figsize=(8, 5))
plt.plot(testAcc, label="Test Data")
plt.plot(trainAcc, label="Train Data")
plt.legend()
plt.xlabel("k")
plt.ylabel("Accuracy")
plt.show()

########################random forest################################
rf = RandomForestClassifier(n_estimators=3)
rf.fit(x, y)
rf.score(c_x, c_y)

small = real_table[['nearSales','avgMonth','numberOfSales','totalBizman']]
sm_x = small
sm_y = real_table['class_to_num']
sm_y
########################DNN##########################################
model = Sequential()
model.add(Dense(64, activation='relu', input_shape=(18,)))
model.add(Dropout(0.5))
model.add(Dense(32, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='relu'))
model.compile(loss='mse', optimizer= 'adam', metrics=['accuracy'])

hist = model.fit(x, y, epochs=200,validation_split=0.2)

fig, ax1 = plt.subplots()
ax2 = ax1.twinx()
ax1.plot(hist.history['acc'], color= 'red')
ax2.plot(hist.history['loss'], color= 'blue')
ax1.set_xlabel("Epoch")
ax1.set_title("Performance of Training Data")
ax1.set_ylabel("Accuracy", color = 'red')
ax2.set_ylabel("Loss", color = 'blue')
plt.show()

k = pd.DataFrame(pred_c_y)
t= []
for i in k.iloc[:,0] :
    t.append(round(i))

qw = 0;
for z, x in zip(c_y, t):
    if z == x:
        qw = qw + 1;

print(qw / len(c_y))


#########Voting Classifier - Multiple Model Ensemble
evc = VotingClassifier(estimators = [('gbc', gbc),('knn', knn),('rf', rf)], voting = 'soft')
evc.fit(x, y)
evc.score(c_x, c_y)

real_class_predict = evc.predict(c_x)

#x,y값
r_x = real_table.iloc[:,3:-3]
r_y = real_table['sales']

#c_x
c_r_x = compare_table.iloc[:,3:-3]
c_r_y = compare_table['sales']

####################################################Ridge 모델#####################################
ridge_m = Ridge()
ridge_params = { 'max_iter':[3000], 'alpha': [0.01, 0.1, 1, 2, 3, 4, 10, 30, 100, 200, 300, 400, 800, 900, 1000]}
rmsle_scorer = metrics.make_scorer(rmsle, greater_is_better = False)
grid_ridge_m = GridSearchCV( ridge_m, ridge_params, cv = 5)
grid_ridge_m.fit(r_x,r_y)
print(grid_ridge_m.score(c_r_x, c_r_y))

####################################################Lasso 모델#####################################
lasso_m = Lasso()
alpha = 1/np.array([0.01, 0.1, 1, 2, 3, 4, 10, 30, 100, 200, 300, 400, 800, 900, 1000])
lasso_params = { 'max_iter':[3000], 'alpha': alpha}
grid_lasso_m = GridSearchCV( lasso_m, lasso_params, cv = 5)
grid_lasso_m.fit(r_x,r_y)
print(grid_lasso_m.score(c_r_x, c_r_y))
pred_lasso = grid_lasso_m.predict(c_r_x)
print(pred_lasso)
print(len(pred_lasso))

####################################################svr 모델#####################################
from sklearn.svm import SVR
svr = SVR(C = 1.0, epsilon = 0.2)
svr.fit(r_x,r_y)
svr.score(c_r_x, c_r_y)

pred_svr_c = svr.predict(c_r_x)
pred_svr = svr.predict(r_x)
print(pred_svr)
print(len(pred_svr))

####################################################gbr 모델#####################################

gbr = GradientBoostingRegressor()
gbr.fit(r_x,r_y)
gbr.score(c_r_x, c_r_y)

pred_gbr_c = gbr.predict(c_r_x)
pred_gbr = gbr.predict(r_x)
print(pred_gbr)
print(len(pred_gbr))

len(c_r_y)
cry_list = c_r_y.tolist()
ry_list = r_y.tolist()

origin_df = pd.DataFrame(columns = ['ridge','svr','gbr'])
pred_df = pd.DataFrame(columns = ['ridge_c','svr_c','gbr_c' ])

origin_df['ridge'] = pred_ridge
origin_df['svr'] = pred_svr
origin_df['gbr'] = pred_gbr
pred_df['ridge_c'] = pred_ridge_c
pred_df['svr_c'] = pred_svr_c
pred_df['gbr_c'] = pred_gbr_c

origin_df['real'] = ry_list
pred_df['real'] = cry_list

####################################################regression ensemble모델#####################################

stacker= LinearRegression()
stacker.fit(origin_df[['ridge', 'svr', 'gbr']], origin_df['real'])
stacker.predict(pred_df[['ridge_c', 'svr_c', 'gbr_c']])
print(stacker.score(pred_df[['ridge_c', 'svr_c', 'gbr_c']],pred_df['real']))
real_predict = stacker.predict(pred_df[['ridge_c', 'svr_c', 'gbr_c']])
real_predict
rp = pd.DataFrame(real_predict)
rp = rp.apply(lambda x : np.exp(x))


