def feq(a,b):
    if abs(a-b)<0.00000001:
        return 1
    else:
        return 0

from bisect import bisect_left

def bsearch(a, x, lo=0, hi=None):   # can't use a to specify default for hi
    hi = hi if hi is not None else len(a) # hi defaults to len(a)   
    pos = bisect_left(a,x,lo,hi)          # find insertion position
    return (pos if pos != hi and a[pos] == x else -1) # don't walk off the end

def intersect(line1, line2):                      #check intersection of two lines
    #print line1
    #print line2
    (x1,y1), (x2,y2) = line1
    (u1,v1), (u2,v2) = line2
    (a,b), (c,d) = (x2-x1, u1-u2), (y2-y1, v1-v2)
    e, f = u1-x1, v1-y1
    denom = float(a*d - b*c)
    if feq(denom, 0):
        # parallel
        return False
    else:
        t = (e*d - b*f)/denom
        s = (a*f - e*c)/denom
        # When 0<=t<=1 and 0<=s<=1 the point of intersection occurs within the
        # line segments
        return 0<=t<=1 and 0<=s<=1
def checkconf(i):                                    # function to check a configuration
	     line=n.zeros((dof+1,4))
       	     flag=0
	     line[0,0:2]=[0, 0]
	     angle=conf[i,0]
	     for j in xrange(0,dof):
		     line[j,2:4]=[line[j,0]+dll[j]*math.cos(angle), line[j,1]+dll[j]*math.sin(angle)]
	             for k in xrange(0,nob):
		           line2=obs[k,0:4]
			   l1=n.array([line[j,0:2],line[j,2:4]])
		           l2=n.array([line2[0:2],line2[2:4]])
	                   if(intersect(l1,l2)):
			      flag=1
			      return 1
		     if(flag):
		       return 1
	             line[j+1,0:2]=line[j,2:4]
	             angle=angle+conf[i,j]
	     if(flag):
	       return 1

import numpy as n
import matplotlib.pyplot as plt
import csv
import networkx as nx
import math

N=30000
nob=2
dof=2
obstacle_type=1
dll=[200,200]

arr=n.genfromtxt("knn_d"+str(dof)+".csv",delimiter=',')
g=nx.Graph()
for i in xrange(0,N):
	g.add_node(i)
obs=n.genfromtxt("obstacle"+str(obstacle_type)+".csv",delimiter=',')
conf=n.genfromtxt("conf_"+str(dof)+".csv",delimiter=',')
line=n.zeros((dof+1,4))
flag=0
ct=0
nnod=[]
for i in xrange(0,N):
	     if(checkconf(i)):
	       g.remove_node(i)
	       nnod.append(i)
	       ct=ct+1	

print ct
q1=n.zeros(dof)
q2=n.zeros(dof)
nod=g.nodes()
for i in nod:                         #local planner and edge construction
	t=0
	for j in xrange(1,200):
		if bsearch(nnod,arr[2*i+1][j])==-1:
			q1=conf[i]
			q2=conf[arr[2*i+1][j]]
			flag=0
			for k in xrange(1,64):
				q_mid=q1+(q2-q1)/64*k
				line[0,0:2]=[0, 0]
				angle=q_mid[0]
				for m in xrange(0,dof):
					line[m,2:4]=[line[m,0]+dll[m]*math.cos(angle), line[m,1]+dll[m]*math.sin(angle)]
					for o in xrange(0,nob):
						line2=obs[o,0:4]
						l1=n.array([line[m,0:2],line[m,2:4]])
						l2=n.array([line2[0:2],line2[2:4]])
						if(intersect(l1,l2)):
							flag=1
							break
					if(flag):
						break
					line[m+1,0:2]=line[m,2:4]
					angle=angle+q_mid[m]
			if flag==0:
				g.add_edge(i, arr[2*i+1][j],weight=arr[2*i][j])
				print(i,arr[2*i+1][j])
				t=t+1
		if t==5:
			break

start=[90,0]          #change accordingly
end=[300, 330]        #change accordinngly
mi=dof*4*n.pi*n.pi+1
diff=0
for i in nod:
	diff=0
	for k in xrange(0,dof):
	    ang=abs(math.radians(start[k])-conf[i][k])
	    if(ang>n.pi):
		ang=2*n.pi-ang
	    diff=diff+ang*ang
	#print(diff,i)
	if(diff<mi):
		mi=diff
		startq=i
mi=dof*4*n.pi*n.pi+1
for i in nod:
	diff=0
	for k in xrange(0,dof):
	    ang=abs(math.radians(end[k])-conf[i][k])
	    if(ang>n.pi):
		ang=2*n.pi-ang
	    diff=diff+ang*ang
	#print(diff,i)
	if(diff<mi):
		mi=diff
		endq=i
print(startq,endq)
path=nx.dijkstra_path(g,startq,endq)
print path

