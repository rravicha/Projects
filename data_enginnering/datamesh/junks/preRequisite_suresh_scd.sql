Create Database :
-----------------
spark.sql("create database kms")
result1 = spark.sql("show databases")
result1.show()

Create tables :
---------------
spark.sql("create table src_account (acct_nbr varchar(20),primary_state varchar(10),zip_code varchar(10)) partitioned by (load_date varchar(12)) stored as parquet")

result2 = spark.sql("show tables")
result2.show()

spark.sql("create table account(acct_nbr varchar(20),account_sk_id bigint,primary_state varchar(10),zip_code varchar(10),eff_start_date varchar(12),eff_end_date varchar(12),load_tm varchar(30),hash_key string,eff_flag varchar(2)) stored as parquet")
result3 = spark.sql("show tables")
result3.show()

spark.sql("create table account_stg (acct_nbr varchar(20),account_sk_id bigint,zip_code varchar(10),primary_state varchar(10),eff_start_date varchar(10),eff_end_date varchar(10),load_tm varchar(30),hash_key string,eff_flag varchar(2),upd_ins_flag varchar(1))stored as parquet")
result4 = spark.sql("show tables")
result4.show()

Insert value for src_account table :
-------------------------------------
spark.sql("insert into table src_account PARTITION (load_date='2016-11-08') values ('1','TN','TN10001')");
spark.sql("insert into table src_account PARTITION (load_date='2016-11-08') values ('2','TN','TN10002')");
spark.sql("insert into table src_account PARTITION (load_date='2016-11-08') values ('3','TN','TN10003')");

Result :
--------
result5 = spark.sql("select * from src_account")
result5.show()

hive> select * from src_account;
OK
1       TN      TN10001 2016-11-08
2       TN      TN10002 2016-11-08
3       TN      TN10003 2016-11-08

Then, execute below code to store history :
spark-submit scd2_hist_transform_spark.py kmc account src_account '2016-11-08' hist
submit scd2_hist_transform_spark.py kmc account src_account '2016-11-08' his
tansform_spark.py kmc account src_account '2016-11-08' hist
spark-submit 'file:///C:/Moody/Code/suresh_k/scd2_hist_transform_spark.py' kmc account src_account '2016-11-08' hist
'file:///C:/Moody/Code/employee.txt'

Result will be like :
---------------------
result6 = spark.sql("select * from account")
result6.show()

hive> select * from account;
OK
1       1       TN10001 TN      2016-11-08      3100-12-31      2018-10-22 09:02:21     AC7280054C9C2868B5D29359B5B3AD19A5ED616FF6CAFA0CBBCB61751F453CBE        Y
2       2       TN10002 TN      2016-11-08      3100-12-31      2018-10-22 09:02:21     F3B548680278360F53F9F54E34C55B396D27E01681DB237E7AE335EE1FCEDFEE        Y
3       3       TN10003 TN      2016-11-08      3100-12-31      2018-10-22 09:02:21     B97BB2B6B9938BCF08509DE0C6B9112C0FB22A1C06AB4CF0AA592E44A02E7FF6        Y
4       4       TN10004 TN      2016-11-08      3100-12-31      2018-10-22 09:02:21     25BC86D9AD5A98C5933F4E05E3EB18AFA777AEAD850D396310368008E39BCDCA        Y

Then, execute below code to store delta


#spark-submit scd2_hist_transform_spark.py kmc account src_account '2016-11-08' delta

spark-submit 'file:///C:/Moody/Code/suresh_k/scd2_hist_transform_spark.py' kmc account src_account '2016-11-08' delta

Result will be like :
---------------------
result7 = spark.sql("select * from account_tgt")
result7.show()

hive>  select * from account_tgt;
OK
1       5       TN10001 TN      2016-11-08      3100-12-31      2018-10-22 09:08:24     AC7280054C9C2868B5D29359B5B3AD19A5ED616FF6CAFA0CBBCB61751F453CBE        Y      I
2       6       TN10002 TN      2016-11-08      3100-12-31      2018-10-22 09:08:24     F3B548680278360F53F9F54E34C55B396D27E01681DB237E7AE335EE1FCEDFEE        Y      I
3       7       TN10003 TN      2016-11-08      3100-12-31      2018-10-22 09:08:24     B97BB2B6B9938BCF08509DE0C6B9112C0FB22A1C06AB4CF0AA592E44A02E7FF6        Y      I
4       8       TN10004 TN      2016-11-08      3100-12-31      2018-10-22 09:08:24     25BC86D9AD5A98C5933F4E05E3EB18AFA777AEAD850D396310368008E39BCDCA        Y      I


			
			
			
			
			
			
			
			
			
			

