%Do value iteration, where depending on the time horizon, you pick the best
%goal up to that point.
%This is the Q function where you pick an action, follow the policy, then
%get some expected value. Pick the action that will give you the largest
%reward combining policy and action.  

function act = One_Step_Lookahead(state,pis)
sp=ones(1,3);
Value=[];
for i=1:7
    gamma=0.9;
    rewards=0;
    %if the state(3)==12 then convert to the 0 index.
    if state(3)==12
        state(3)=0;
    end
    sp(1,:)=Update_Action_Switch([state(1),state(2),state(3)],i,0);%Evaluate
    %each action
    paths=Plot_Trajectory(pis,[sp(1),sp(2),sp(3)],0);%follow policy starting
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
        rewards=rewards+Generate_Grid([paths(m,1),paths(m,2),paths(m,3)]);%evaluate reward for each
        %position that you are in.
    end
    if (paths(size(paths,1),1)==5) && (paths(size(paths,1),2)==4)
        future_discount=rewards+power(gamma,(size(paths,1)))*(1/(1-gamma));%accounts for infinite time reward.
        if paths(size(paths,1))>1
            Value(i)=future_discount-1;
        else
            Value(i)=future_discount;
        end
    else
        Value(i)=rewards;
    end
end
[C,act]=max(Value);%if act is 1 meaning that the previous decision was the highest 
disp(rewards)
%value then do not change the value of the state that was there before
end