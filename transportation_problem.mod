/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Jakub Choptiany (github.com/JChoptiany)
 *********************************************/

 // Problem: Classic transportation problem with M factories and N distribution centres.
 
 range m = 1..3;
 range n = 1..3;
 int cost[m][n] = [[3,12,13],
 				   [5,10,3],
 				   [7,9,9]];
 				   
 dvar int+ x[m][n];
 int supply[m] = [50, 70, 30];
 int demand[n] = [20, 40, 90]; 
 
 assert sum(i in m)supply[i] == sum(j in n) demand[j];
 
 dexpr int total_cost = sum(i in m, j in n) x[i][j] * cost[i][j];
 minimize total_cost;
 subject to {
   forall(i in m) sum(j in n) x[i][j] == demand[i];
   forall(j in n) sum(i in m) x[i][j] == supply[j];
 }