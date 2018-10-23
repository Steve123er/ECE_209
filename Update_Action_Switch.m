%evaulate action

%a can take any of the 

%Defining my state space
%1 do nothing
%2 forward with no rotation
%3 forward rotate clockwise
%4 forward rotate counter-clockwise
%5 backward with no rotation
%6 backward rotate clockwise
%7 backward rotate counter-clockwise

%My coordinate system is defined as (y,x,h), 1 indexed
%For example, x=1, y=4 h=6 would be described as 
%(5,2,6) when indexing by state.  

function sp =Update_Action_Switch(s,a,pe)
    h=s(3);
    sp=[s(1),s(2),s(3)];
    if a==1
        sp=s;%stay where you are
    else
        %include a pre rotation error
    if pe>0
        r=rand(1);
        if r<pe
            sp(3)=mod(sp(3)+1,12);
        elseif pe<r<2*pe
            sp(3)=mod(sp(3)-1,12);
        else
            %robot continues as is
        end
    end
    
    
    if (h== 11||h==0||h==1) && (s(1)<6) && (s(1)>1) %point up
        act={{0,0,0},{1,0,0},{1,0,1},{1,0,-1},{-1,0,0},{-1,0,1},{-1,0,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 11||h==0||h==1) && s(1)==1
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{1,0,0},{1,0,1},{1,0,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 11||h==0||h==1) && s(1)==6
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{-1,0,0},{-1,0,1},{-1,0,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    end
    
    
    if (h== 2||h==3||h==4) && (s(2)>1)  && (s(2)<6) %point right
        act={{0,0,0},{0,1,0},{0,1,1},{0,1,-1},{0,-1,0},{0,-1,1},{0,-1,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 2||h==3||h==4) && s(2)==1 
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{0,1,0},{0,1,1},{0,1,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 2||h==3||h==4) && s(2)==6
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{0,-1,0},{0,-1,1},{0,-1,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    end
    
    
    if (h== 5||h==6||h==7) && (s(1)>1)  && (s(1)<6)%point down
        act={{0,0,0},{-1,0,0},{-1,0,1},{-1,0,-1},{1,0,0},{1,0,1},{1,0,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 5||h==6||h==7) && s(1)==1 %point down
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{1,0,0},{1,0,1},{1,0,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 5||h==6||h==7) && s(1)==6 %point down
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{-1,0,0},{-1,0,1},{-1,0,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    end
    
    
    if (h== 8||h==9||h==10) && (s(2)>1) && (s(2)<6)%point left
        act={{0,0,0},{0,-1,0},{0,-1,1},{0,-1,-1},{0,1,0},{0,1,1},{0,1,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 8||h==9||h==10) && s(2)==1 %point left
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{0,1,0},{0,1,1},{0,1,-1}};
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    elseif (h== 8||h==9||h==10) && s(2)==6 %point left
        act={{0,0,0},{0,0,0},{0,0,1},{0,0,-1},{0,-1,0},{0,-1,1},{0,-1,-1}};%Just turn away
        sp=cell2mat(act{a})+sp;
        sp(3)=mod(sp(3),12);
    end
    
    if sp(1,1)==0
        sp(1,1)=1;
    end
    if sp(1,2)==0
        sp(1,2)=1;
    end
    if sp(1,3)==0
        sp(1,3)=12;
    end
    if sp(1,1)==7
        sp(1,1)=6;
    end
    if sp(1,2)==7
        sp(1,2)=6;
    end
    
    
    end
    
end
