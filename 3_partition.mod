/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Jakub Choptiany (github.com/JChoptiany)
 *********************************************/

 // Problem: Distribute given numbers into 3-element sets so that the sum of the numbers in each of them is equall to given W.

 using CP;
 
 int number_of_numbers = 6;
 range n = 1..number_of_numbers;
 range m = 1..ftoi(number_of_numbers/3);
 int W = 13;
 
 int numbers[n] = [1, 8, 5, 4, 2, 6];
 
 dvar boolean selection[n][m];
 
 maximize 0;
 subject to {
	forall(i in n) sum(j in m) selection[i][j] == 1;
	forall(j in m) sum(i in n) selection[i][j] == 3;
	forall(j in m) sum(i in n) selection[i][j] * numbers[i] == W;
 }