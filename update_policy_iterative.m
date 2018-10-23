%we can now do policy iterations.  

tic
for i=1:10
pip=policy_update(pip,pe);
end
toc