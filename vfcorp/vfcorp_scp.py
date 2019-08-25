#!/usr/bin/python3
'''
Build Type : Prototype
Project Name : Supply Chain Planning
This module follows the functional prograaming methodology
and needs the following arguments to be passed

Version 1.0 - the program will function for all necessity
Version 2.0 - the program will have a complex functionality
Version 2.1  - will adhere to OOPS
'''
#Needed imports
#import sys
import pandas as pd
#import logging as l
#global variables

#function declarations
#INITIALIZATION
xlsx='vfcorp_scp.xlsx'
dmdSheet='demand'
wipSheet='wip'
onhandSheet='onhand'
l='-----------------------------------------------------------------'
def line():
       print(l)
#READ DEMAND FILE
dmd=pd.read_excel(xlsx,dmdSheet)
print(dmd)
#READ ONHAND FILE
ohd=pd.read_excel(xlsx,onhandSheet)
print(ohd)
#READ WIP FILE
wip=pd.read_excel(xlsx,wipSheet)
print(wip)
line()
#build HASHES
dmd_d={}
for i in range(len(dmd)):
    dmd_k=str(dmd.values[i][0])+'~'+str(dmd.values[i][1])+'~'+str(dmd.values[i][2])+'~'+str(dmd.values[i][3])+'~'+str(dmd.values[i][4])
    dmd_v=dmd.values[i][-1]
    dmd_d[dmd_k]=dmd_v
