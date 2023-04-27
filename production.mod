/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Jakub Choptiany (github.com/JChoptiany)
 *********************************************/
 
 /* 
 	Problem: 
 	The company produces items 1,2,3,...,N. 
 	The production of each product requires a certain number of labor hours and a certain amount of resources 
 	(e.g. material, raw materials, etc.). 
 	The company's resources are limited. 
 	Moreover, all items can only be produced by renting a suitable machine. 
 	The profit from the production of each and the cost of renting each are also known. 
 	The company would like to maximize its profit.
 */
 
 int number_of_products = 6;
 int number_of_materials = 3;
 
 range n = 1..number_of_products;
 range m = 1..number_of_materials;
 
 int material_cost[m] = [10, 20, 12];
 int material_usage[n][m] = [[10, 2, 0],
 							[2, 3, 8],
 							[5, 5, 5],
 							[9, 1, 2],
 							[4, 2, 3],
 							[6, 2, 1]];
 							
 int time_needed[n] = [300, 400, 250, 220, 100, 300];
 int machine_cost[n] = [10, 11, 20, 9, 25, 11];
 int product_price[n] = [3000, 4000, 5000, 3400, 2300, 4000];
 int material_limit[m] = [2500, 2000, 3000];
 
 dvar int+ production[n];
 dexpr int total_price = sum(i in n) production[i] * product_price[i];
 dexpr int total_cost = sum(i in n, j in m) production[i] * (time_needed[i]*machine_cost[i] + material_usage[i][j]*material_cost[j]);
 
 minimize total_price - total_cost;
 subject to {
   forall(i in m) sum(j in n) production[j]*material_usage[j][i] <= material_limit[i];
 }