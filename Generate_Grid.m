%Problem Set#2 Question #2
function Rs = Generate_Grid(s)
%Create code to simulate the markov decision robot
L=6;
W=6;
gird_world=zeros(6,6,12);%Enumerate all possible steps
for j=1:6 %Note using the matlab coordinate system which is 1 indexed
    for k=1:6
        if k==1||k==W||j==1||j==L
            gird_world(j,k,:)=-100;
        elseif j==5 && k==4
            gird_world(j,k,:)=1;
        elseif k==3 || k==5
            if j>2 && j<6
            gird_world(j,k,:)=-10;
            end     
        end
    end
end
Rs=gird_world(s(1),s(2),s(3));
end

