/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Jakub Choptiany (github.com/JChoptiany)
 *********************************************/

 // Problem: Find the shortest path connecting 2 given nodes in graph
 
 int number_of_nodes = 5;
 range n = 1..number_of_nodes;
 int distance[n][n] = [ [1000, 1, 6, 7, 13],
 						[9, 1000, 20, 1, 5],
 						[7, 3, 1000, 1, 5],
 						[7, 2, 5, 1000, 20],
 						[8, 3, 2, 1, 1000]];
 int start_node = 1;
 int end_node = 5;
 
 dvar boolean used_edges[n][n];
 dexpr int total_distance = sum(i in n, j in n) used_edges[i][j] * distance[i][j];
 
 minimize total_distance;
 subject to {
 	sum(i in n) used_edges[start_node][i] == 1;
 	sum(i in n) used_edges[i][end_node] == 1;
 	forall(i in n: i not in {start_node, end_node}) (sum(j in n) used_edges[i][j] == sum(j in n) used_edges[j][i]);
 } 