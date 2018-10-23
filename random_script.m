               i=1
               j=2
               k=3
             m=4
                    sp=ones(m,3);
                    state=[i j k];
                    disp(size(state))
                    Update_Action_Switch([i,j,k],m,0);
                    if sp(m,3)==0
                        sp(m,3)=12;
                    end
                    rewards(m)=Generate_Grid([sp(m,1),sp(m,2),sp(m,3)]);%evaluate reward for each
        