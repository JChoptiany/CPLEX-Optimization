/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Jakub Choptiany (github.com/JChoptiany)
 *********************************************/

 // Problem: Schedule N tasks on M machines to minimize finish time on the last machine (minimize differences between total times on all machines).
 
int number_of_machines = 6;
int number_of_tasks = 10;
range m = 1..number_of_machines; 
range n = 1..number_of_tasks; 
dvar boolean x[m][n];
int tasks[n] = [1,2,5,2,4,1,3,5,3,1]; // time of each tasks

dexpr int machine_time[j in m] = sum(i in n) (x[j][i]*tasks[i]);
dexpr int total_time = sum(i in n) tasks[i];
dexpr float target_time = total_time / number_of_machines;
dexpr float time_difference = sum(j in m) abs(target_time - machine_time[j]);

minimize time_difference;
subject to {
	forall(i in n) sum(j in m) x[j][i] == 1;
}
