/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Jakub Choptiany (github.com/JChoptiany)
 *********************************************/

 // Problem: Schedule N tasks on M machines to get minimal total time. Written in quantum format (penalty function).
 
 int P = 1000;
 int number_of_machines = 6;
 int number_of_tasks = 10;
 range m = 1..number_of_machines; 
 range n = 1..number_of_tasks;
 range k = 1..number_of_machines*number_of_tasks;
 dvar boolean x[k];
 int tasks[n] = [1,2,3,2,3,2,5,6,4,2];

 dexpr int machine_time[j in m] = sum(i in n) (x[i+(j-1)*number_of_tasks] * tasks[i]);
 dexpr int total_time = sum(i in n) tasks[i];
 dexpr float target_time = total_time / number_of_machines;
 dexpr float time_difference = sum(j in m) (target_time - machine_time[j])^2;
 dexpr float multiple_assignment_penalty = P*(sum(i in n) (1 - sum(j in 0..number_of_machines-1) x[i+j*number_of_tasks])^2);
 dexpr float wrong_total_number_of_tasks_penalty = P*(sum(i in k)(x[i]) - number_of_tasks)^2;
 
 minimize time_difference + multiple_assignment_penalty + wrong_total_number_of_tasks_penalty;