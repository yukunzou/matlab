function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
n = size(theta);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%               ����Ҫע����� theta(0) ����Ҫ�μ�����֮�У����ǿ��������ٹ���һ���µ�theta_non��ֻ����2-n��theta���������ڶ������򻯣����ӳͷ���

hx = sigmoid(X * theta);
theta_non = [0; theta(2 : end)] ;
J = (1 / m) * ( sum( -y .* log(hx)  -  (1 - y) .* log(1 - hx ) ) ) + (lambda / (2*m)) * sum( theta_non .^2) ;
for j = 1 : n
        grad(j) = (1 / m) * sum( (hx - y) .* X(:, j) ) + (lambda / m) * theta_non(j);
end

% or the second method ��using vector to calculate��
%     grad = (1 / m) * X' * (hx - y)  +  (lambda / m) * theta_non; 

% =============================================================

end