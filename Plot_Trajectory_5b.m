%Plot Trajectory
%Take the initial value, taking into account the 
%heading and the next value, and draw a trajectory.  
%So we have s, with the first arrow, then we run the function update_Action
%when we put in the policy matrix that tells you what the next state s'
%should be.  So then you draw the second arrow.  Keep going until you reach
%the goal state, the initial policy should be able to reach the goal state,
%although it may not be the most optimal because we did not do policy
%iteration yet.  
%So=s(1,4,6);%Starting position, the robot is pointing down.  
%pass the output of the array as a starting point to the function 
%then use update Action to give you the orientation to go to next.  

function path = Plot_Trajectory_5b(pis,So,pe)
path=zeros(1,3);
for i=1:30 %loop for 30 iterations.
    if pe==0
        if So(3)==0
            So(3)=12;
        end
        if So(2)>6
            So(2)=6;
        end
        if So(1,1)==0
            So(1,1)=1;
        end
        if So(1,2)==0
            So(1,2)=1;
        end
        if So(1,3)==0
            So(1,3)=12;
        end
        if So(1,1)==7
            So(1,1)=6;
        end
        if So(1,2)==7
            So(1,2)=6;
        end
        action=pis(So(1),So(2),So(3));%split the state variable into three components y,x,h
        if So(3)==12%account for
            So(3)=0;
        end
        path(i,:)=Update_Action_Switch(So,action,pe);%Create next step sp = s'
        So=path(i,:);
        if (path(i,1)==5) && (path(i,2)==4) && ((path(i,3)==5) || (path(i,3)==6) || (path(i,3)==7))
            break;
        end
    else
        if So(3)==0
            So(3)=12;
        end
        if So(2)>6
            So(2)=6;
        end
        if So(1,1)==0
            So(1,1)=1;
        end
        if So(1,2)==0
            So(1,2)=1;
        end
        if So(1,3)==0
            So(1,3)=12;
        end
        if So(1,1)==7
            So(1,1)=6;
        end
        if So(1,2)==7
            So(1,2)=6;
        end
        action=pis(So(1),So(2),So(3));%split the state variable into three components y,x,h
        if So(3)==12%account for
            So(3)=0;
        end
        path(i,:)=Update_Action_Switch(So,action,pe);%Create next step sp = s'
        So=path(i,:);
        if (path(i,1)==5) && (path(i,2)==4)
            break;
        end
    end
end

end

