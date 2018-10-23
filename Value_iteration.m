%Value iteration for the MDP robot.
function [Value, policy]= Value_iteration(pe,iterations,heading)
Old_Value = zeros(6,6,12);%store the values of the value function.
New_Value = zeros(6,6,12);
Old_policy = ones(6,6,12);
New_policy = ones(6,6,12);
%Iterations of the value iteration compare old and new Value
for n=1:iterations
    
    for i=1:6
        for j=1:6
            for k=1:12
                [val,act]=One_Step_Lookahead_Value([i,j,k],Old_policy,n,pe,heading);
                OldValue=Old_Value(i,j,k);
                OldPolicy=Old_policy(i,j,k);
                NewValue=val;
                if NewValue>OldValue
                    New_Value(i,j,k)=NewValue;
                    New_policy(i,j,k)=act;
                else
                    New_Value(i,j,k)=OldValue;
                    New_policy(i,j,k)=OldPolicy;
                end
            end
        end
    end
    Old_Value=New_Value;
    Old_policy=New_policy;
end
Value=New_Value;
policy=New_policy;
end

function [Val,act] = One_Step_Lookahead_Value(state,pis,n,pe,heading)
sp=ones(1,3);
Value=[];
for i=1:7
    gamma=0.9;
    rewards=0;
    %if the state(3)==12 then convert to the 0 index.
    if state(3)==12
        state(3)=0;
    end
    
    sp(1,:)=Update_Action_Switch([state(1),state(2),state(3)],i,pe);%Evaluate
    %each action
    paths=Plot_Trajectory(pis,[sp(1),sp(2),sp(3)],pe,heading);%follow policy starting
    %with a certain action.
    for m=1:size(paths,1)%Generate the reward for each step.
        if paths(m,3)==0
            paths(m,3)=12;
        end
        if paths(m,1)==0
            paths(m,1)=1;
        end
        if paths(m,2)==0
            paths(m,2)=1;
        end
        if paths(m,1)==7
            paths(m,1)=6;
        end
        if paths(m,2)==7
            paths(m,2)=6;
        end
        rewards=rewards+(1-pe)*Generate_Grid([paths(m,1),paths(m,2),paths(m,3)]);%evaluate reward for each
        %position that you are in. Also include error probablity.  
    end
        %Value(i)=rewards;
        
     if (paths(size(paths,1),1)==5) && (paths(size(paths,1),2)==4)
        future_discount=rewards+power(gamma,n)*(1/(1-gamma));%accounts for infinite time reward.
        if paths(size(paths,1))>1
            Value(i)=future_discount-1;
        else
            Value(i)=future_discount;
        end
    else
        Value(i)=rewards;
    end
end
[Val,act]=max(Value);%if act is 1 meaning that the previous decision was the highest 
%value then do not change the value of the state that was there before
end