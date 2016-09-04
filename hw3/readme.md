#Articulated Robot Motion Planning
##CS365-Assignment 4
Initial configuration of robot arms of dof 2 and 5 are given and obstacle in workspace is given. We have to train our robot acording to the environment and give the path from initial configuration to final configuration.

###Files Description
Knn.py - paramenters( dof, N, k) generates random N configuration of degree of freedom 'dof' and stores k nearest neighbours.

Path.py - parameters( nob, obstacle_type, dof, dll, N, startq, endq) geneate graph of configuration using local planner and obstacle type and gives path between startq and endq provided start and end configurations are valid.

nob: number of obstacle in obstacle file

obstacle_type: two sets of obstacle provided in input

dll: array of size dof of link lengths

dof: degree of freedom

N: number of configuration

startq, endq: start and end configuration to trace path

###Source code language
Python

###problem statement
http://cse.iitk.ac.in/users/cs365/2015/hw3.html

###my submission
http://home.iitk.ac.in/~vikasj
