function [x,obj,info,output,lambda,states] = solve_sqopt(start,name,m,n,userHx, ...
						  c, x0, xl, xu, xstate, xmul, ...
						  neA, indA, locA, valA, ...
						  al, au, astate, amul)
%function [x,obj,info,output,lambda,states] = solve_sqopt(start,name,m,n,userHx, ...
%						  c, x0, xl, xu, xstate, ...
%						  xmul, ...
%						  neA, indA, locA, valA, ...
%						  al, au, astate, amul)
% Wrapper for solving QPs

mexopt = 1;
[x,obj,info,itn,y,state] = sqoptmex(mexopt, start, name, ...
				    m, n, userHx, c, ...
				    x0, xl, xu, xstate, xmul, ...
				    neA, indA, locA, valA, al, au, astate, amul);
% Set output
output.iterations = itn;
output.info       = info;

states.x = state(1:n);
lambda.x = y(1:n);

if m > 0,
  states.linear = state(n+1:n+m);
  lambda.linear = y(n+1:n+m);
end
