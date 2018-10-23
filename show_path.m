function show_path(So,trajectory)
figure
hold on
%initial condition
x=So(2);
y=So(1);
scatter(x,y,200,'d')%Diamond
for i= 1:size(trajectory,1)
    
    x=trajectory(i,2);
    y=trajectory(i,1);
    h=trajectory(i,3);
    if i == size(trajectory,1)
        scatter(x,y,200,'x')
    else
        scatter(x,y,200,[h/12 0 1-h/12],'filled') %6 is violet 
    end
    axis([1 6 1 6])
    
end
hold off
end

