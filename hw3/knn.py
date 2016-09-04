import numpy as n
import csv
dof=5
dll=[100,100,100,100,80]
N=30000
nn=200
conf=n.random.uniform(0,2*n.pi,(N,dof))
n.savetxt("conf_"+str(dof)+".csv",conf,delimiter=",")
ar=n.zeros((2,N))
b=open("knn_d"+str(dof)+".csv",'w')
for i in xrange(0,N):
 for j in xrange(0,N):
   ar[1][j]=j
   diff=0
   for k in xrange(0,dof):
    ang=abs(conf[j][k]-conf[i][k])
    if(ang>n.pi):
        ang=2*n.pi-ang
    diff=diff+ang*ang
   ar[0][j]=diff
 key=zip(ar[0],ar[1])
 key.sort()
 ar[1]=[x for y, x in key]
 ar[0].sort()
 br=ar[:,0:nn]
 a=csv.writer(b)
 a.writerows(br)  
b.close()

