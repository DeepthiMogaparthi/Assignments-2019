#------problem statement--------
#List of Tuples :  [(1, 2), (3, 4), (5, 6)]
#List of Lists:  [[1, 2], [3, 4], [5, 6]]

list1 = [(1,2),(3,4),(5,6)] 
print("List of Tuples : ",list1)
 
list2 = list()

for i in list1:
    list2.append(list(i))
print("List of Lists: ",list2)


