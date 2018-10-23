%we can now do policy iterations.  
tic
pe=0.25;
for i=1:10
pip=policy_update(pip,pe);
end
toc