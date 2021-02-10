% octave

Nt=4;
Nr=Nt;

H = ( randn(Nr,Nt) + 1j*randn(Nr,Nt) )/sqrt(2);

% [U, S, V] = svd(A); % A = U*S*V'
% [U, S, V] = svd(H'*H);

[U, S, V] = svd(H);
[v, lambda, w ] = eig(H);

Hsvd = U * S * V';


Hsum=zeros(Nr,Nt);
for i=1:Nt
  %tmp  = U(:,i) * S(i,i) * V(:,i)';
  tmp  = S(i,i) * U(:,i) * V(:,i)';
  Hsum = Hsum + tmp;
end

norm_Hsvd_H = norm(Hsvd-H)
norm_Hsum_H = norm(Hsum-H)
