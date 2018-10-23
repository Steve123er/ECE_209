%main program

%Create the visualization of the trajectory, put in the policy vs value
%iteration things on here.  

%Problem #1 is included within Update_Action_Switch

%% Problem #2
%The function to create the grid is Generate_Grid
%The output is 


%% Problem #3
%Start with the initialization of policy
pip=policy_matrix_2;%Initial policy is returned as pip
heading=0;
gamma=0.9;
policy_iterations=40;
%Do plot of initial Policy This is problems 3 a,b,c
pe=0;
So=[5,2,6];
path=Plot_Trajectory(pip,So,pe,heading);

V=policy_Evaluation2(pip,pe,heading,gamma); %This is problem 3d.  
initial_policy_value=V(5,2,6);%Problem 3e

show_path(So,path)

policy_update(pip,pe,heading); %problem 3f

%policy iteration problem 3g
[pip,V]=Policy_Iteration(policy_iterations,pip,pe,heading);

final_policy_value=V(5,2,6);%Problem 3h


%New trajectory
path=Plot_Trajectory(pip,So,pe,heading);
show_path(So,path)

%%


%%Problem #4 Value Iteration
tic
[Value_VI, policy_VI]=Value_iteration(pe,policy_iterations,heading);
toc
path_VI=Plot_Trajectory(policy_VI,So,pe,heading);

show_path(So, path_VI)%4b


%%
pe=0.25;
%%Problem #5 Additional Senarios
%5a Plotting the path and value without rerunning policy iteration
path_pe_0_25=Plot_Trajectory(policy_VI,So,pe,heading);
show_path(So,path_pe_0_25)
ValRand=policy_Evaluation2(policy_VI,pe,heading,gamma);
ValueRandom=ValRand(5,2,6);


[pip,V]=Policy_Iteration(policy_iterations,pip,pe,heading);

path_pe_0_25=Plot_Trajectory(pip,So,pe,heading);
show_path(So,path_pe_0_25)

heading=1;
%5b with probability error =0 

pe=0;
[pip,V]=Policy_Iteration(policy_iterations,pip,pe,heading);
path_pe_0_25=Plot_Trajectory(pip,So,pe,heading);
show_path(So,path_pe_0_25)
V(5,2,6);
%5b with probability error =0.25
tic
pe=0.25;
[pip,V]=Policy_Iteration(policy_iterations,pip,pe,heading);
V(5,2,6);
path_pe_0_25=Plot_Trajectory(pip,So,pe,heading);
show_path(So,path_pe_0_25)





%%
