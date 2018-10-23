%Problem Set #3
%policy=zeros(l,w,h);
%store a policy for each possible state
%11,0,1 point up
%2,3,4 point to the right
%5,6,7 point down
%8,9,10 point to the left
L=6;
W=6;
gird_world=zeros(L,W);
for j=1:6
    for k=1:6
        if k==1||k==W||j==1||j==L
            gird_world(j,k)=-100;
        elseif j==5 && k==4
            gird_world(j,k)=1;
        elseif k==3 || k==5
            if j>2 && j<6
            gird_world(j,k)=-10;
            end     
        end
        
    end
end


%Create an array for the policy initialization
%Calculate the orientation for the goal
% Result is as follows:
%   -100  -100  -100  -100  -100  -100
%   -100     0     0     0     0  -100
%   -100     0   -10     0   -10  -100
%   -100     0   -10     0   -10  -100
%   -100     0   -10     1   -10  -100
%   -100  -100  -100  -100  -100  -100


