%Policy Evaluation
function pip =  policy_update(pol_Old,pe)
pip=zeros(6,6,12);
%Initialize with a policy evaluation
Val=policy_Evaluation2(pol_Old,pe);
%Take each step and apply a one step lookahead.
for i=1:6
    for j=1:6
        for k=1:12
            %new_act=One_Step_Lookahead([i,j,k],pol_Old);
            [Vals,act]=One_Step_Lookahead([i,j,k],pol_Old,pe);
            OldValue=Val(i,j,k);
            NewValue=Vals;
            if NewValue>OldValue
                pip(i,j,k)=act;
            else
                pip(i,j,k)=pol_Old(i,j,k);
            end
        end
    end
end

end

function [Val,act] = One_Step_Lookahead(state,pis,pe)
sp=ones(1,3);
Value=[];
for i=1:7
    gamma=0.9;
    rewards=0;
    if state(3)==12
        state(3)=0;
    end
    sp(1,:)=Update_Action_Switch([state(1),state(2),state(3)],i,pe);%Evaluate
    %each action
    paths=Plot_Trajectory_5b(pis,[sp(1),sp(2),sp(3)],pe);%follow policy starting
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
        rewards=rewards+(1-2*pe)*Generate_Grid([paths(m,1),paths(m,2),paths(m,3)]);%evaluate reward for each
        %position that you are in.
    end
    if (paths(size(paths,1),1)==5) && (paths(size(paths,1),2)==4)
        future_discount=rewards+power((1-2*pe),size(paths,1))*power(gamma,(size(paths,1)))*(1/(1-gamma));%accounts for infinite time reward.
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