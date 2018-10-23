%main program

%Create the visualization of the trajectory, put in the policy vs value
%iteration things on here.  

%Problem #1 is included within Update_Action_Switch

%% Problem #2
%The function to create the grid is Generate_Grid
%The output is 


%% Problem #3
%Start with the initialization of policy
pip=policy_matrix_2;

%Do plot of initial Policy This is problems 3 a,b,c
pe=0;
So=[5,2,6];
path=Plot_Trajectory(pip,So,pe);

V=policy_Evaluation2(pip,pe); %This is problem 3d.  
V(5,2,6)%Problem 3e

show_path(So,path)

policy_update(pip,pe) %problem 3f

%policy iteration
tic
pe=0;
policy_iterations=40;
for i=1:policy_iterations
    pip=policy_update(pip,pe);
end
toc

%New trajectory
path=Plot_Trajectory(pip,So,pe);
show_path(So,path)

%%


%%Problem #4 Value Iteration
tic
[Value_VI, policy_VI]=Value_iteration(pe,policy_iterations);
toc
path_VI=Plot_Trajectory(policy_VI,So,pe);

show_path(So, path_VI)%4b


%%
pe=0.25;
%%Problem #5 Additional Senarios
%5a Plotting the path and value without rerunning policy iteration
path_pe_0_25=Plot_Trajectory(policy_VI,So,pe);
show_path(So,path_pe_0_25)
ValRand=policy_Evaluation2(policy_VI,pe);
ValueRandom=ValRand(5,2,6);


policy_iterations=40;
for i=1:policy_iterations
    pip=policy_update(pip,pe);
end
toc
path_pe_0_25=Plot_Trajectory(pip,So,pe);
show_path(So,path_pe_0_25)

%5b with probability error =0 
pe=0;
policy_iterations=40;
for i=1:policy_iterations
    pip=policy_update(pip,pe);
end
toc
path_pe_0_25=Plot_Trajectory_5b(pip,So,pe);
show_path(So,path_pe_0_25)

%5b with probability error =0.25
tic
pe=0.25;
policy_iterations=40;
for i=1:policy_iterations
    pip=policy_update(pip,pe);
end
toc
path_pe_0_25=Plot_Trajectory_5b(pip,So,pe);
show_path(So,path_pe_0_25)





%%
