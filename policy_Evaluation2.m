function Value= policy_Evaluation2(pis,pe)
path_length=zeros(1,1,1);
Value=zeros(1,1,1);
gamma=0.9;

for i=1:6
    for j=1:6
        for k=1:12
            paths=Plot_Trajectory_5b(pis,[i,j,k],pe);%5b
            path_length(i,j,k)=size(paths,1);
            rewards=0;
            for m=1:size(paths,1)
                if paths(m,3)==0
                    paths(m,3)=12;
                end
                if paths(m,1)==0
                    paths(m,1)=1;
                end
                if paths(m,2)==0
                    paths(m,2)=1;
                end
                if paths(m,3)==0
                    paths(m,3)=12;
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
                Value(i,j,k)=future_discount-1;
            else
                Value(i,j,k)=rewards;
            end
        end
    end
end

end