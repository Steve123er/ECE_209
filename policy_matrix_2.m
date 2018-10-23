%Problem Set #2 Problem #3
% l=6;
% w=6;
% h=12;
% S=ones(l,w)*h; %All the possible states
% 
% 
% actions=[1,2,3,4,5,6,7];
%1 do nothing
%2 forward with no rotation
%3 forward rotate right
%4 forward rotate left
%5 backward with no rotation
%6 backward rotate right
%7 backward rotate left

%if you are behind the goal, then just turn backward until you find 
%the right orientation, then when in the same row or column and right
%orientation, just move forward. 

%My coordinate system is based on 1 indexing using MATLAB so my coordinate
%system looks like this
% 1 2 3 4 5 6 X direction
% 2
% .
% 6 2       6
% Y direction so the starting point for the problem set is 5,2,6
% but using the convention in the problem set it 1,4,6
%The end goal is thus 5,4,h
%Calculate the action array
function pi=policy_matrix_2 %within policy matrix, put in the state s 
%and get an action to execute next 
policy_matrix=zeros(6,6,12);
W=6;
L=6;
GoalX=4; GoalY=5; % Goal make all states stay here 
for j=1:6
    for k=1:6
        %Calculate the difference between the goal and the current position 
        if j==GoalY && k==GoalX
            policy_matrix(j,k,:)=1;
        elseif j==GoalY && k<GoalX %same row as goal up, down, move forward then turn appropriately
            policy_matrix(j,k,11)=3;
            policy_matrix(j,k,12)=3;
            policy_matrix(j,k,1)=3;
            policy_matrix(j,k,2:4)=2;%point right 
            policy_matrix(j,k,5:7)=4;%backwards
            policy_matrix(j,k,8:10)=5;%left
        elseif j==GoalY && k>GoalX %same row as goal up, down, move forward then turn appropriately
            policy_matrix(j,k,11)=4;
            policy_matrix(j,k,12)=4;
            policy_matrix(j,k,1)=4;
            policy_matrix(j,k,2:4)=5;%right
            policy_matrix(j,k,5:7)=3;%backwards
            policy_matrix(j,k,8:10)=2;%left
        elseif k==GoalX && j<GoalY %same colunm as goal up, down, move forward then turn appropriately
            policy_matrix(j,k,11)=2;
            policy_matrix(j,k,12)=2;
            policy_matrix(j,k,1)=2;
            policy_matrix(j,k,2:4)=4;%point right 
            policy_matrix(j,k,5:7)=5;%backwards
            policy_matrix(j,k,8:10)=3;%left
        elseif k==GoalX && j>GoalY %same colunm as goal up, down, move forward then turn appropriately
            policy_matrix(j,k,11)=5;
            policy_matrix(j,k,12)=5;
            policy_matrix(j,k,1)=5;
            policy_matrix(j,k,2:4)=3;%point right 
            policy_matrix(j,k,5:7)=2;%backwards
            policy_matrix(j,k,8:10)=4;%left
        elseif j>GoalY && k>GoalX % above goal but to the right of goal
            policy_matrix(j,k,11)=6;
            policy_matrix(j,k,12)=6;
            policy_matrix(j,k,1)=6;
            policy_matrix(j,k,2:4)=2;%right
            policy_matrix(j,k,5:7)=3;%backwards
            policy_matrix(j,k,8:10)=6;%left
        elseif j<GoalY && k>GoalX % below goal but to the right of goal
            policy_matrix(j,k,11)=4;
            policy_matrix(j,k,12)=4;
            policy_matrix(j,k,1)=4;
            policy_matrix(j,k,2:4)=3;%right
            policy_matrix(j,k,5:7)=7;%backwards
            policy_matrix(j,k,8:10)=3;%left
        elseif j>GoalY && k<GoalX % above goal but to the left of goal
            policy_matrix(j,k,11)=6;
            policy_matrix(j,k,12)=6;
            policy_matrix(j,k,1)=6;
            policy_matrix(j,k,2:4)=4;%right
            policy_matrix(j,k,5:7)=2;%backwards
            policy_matrix(j,k,8:10)=3;%left
        elseif j<GoalY && k<GoalX % below goal but to the left of goal
            policy_matrix(j,k,11)=2;
            policy_matrix(j,k,12)=2;
            policy_matrix(j,k,1)=2;
            policy_matrix(j,k,2:4)=4;%right
            policy_matrix(j,k,5:7)=7;%backwards
            policy_matrix(j,k,8:10)=3;%left
        end

    end
end
pi=policy_matrix;
end
%Enumerate the different states


%Calculate function Psa


