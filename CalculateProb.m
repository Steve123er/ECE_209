%Calculate probabilites
%s' will be represented as s'
%represent the state as x,y,z
%action space is defined as the movement of x,y,z, plus or minus 1. 
%pe is the pre-rotation error
%s is the current state
%a is the action you want to take
%sp is the next state you want to take
%Psa is the probability of going to the next stage given the parameters

function Psa = CalculateProb(pe,s,a,sp)
    %probablity of prerotation is pe
    %take the action you want to do, ie, move up/down left and right 
    %and consider the ways this can happen.
    sp=s*(1-pe*2)+pe;%include stuff for every action category. 
end