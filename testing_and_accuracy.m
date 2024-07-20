ytst = net(datanormal(:,tr.testInd));
ttst = target(:,tr.testInd);

[c,cm,ind,per]=confusion(ttst,ytst);
cm
benar = sum(diag(cm))
totaldata=sum(sum(cm))
akurasi=(benar/totaldata)*100
% disp(cm);
% Nerr = sum(vec2ind(ytst) ~= vec2ind(ttst));
% PctErr = 100*Nerr/size(ytst,2);
% accuracy = 100 - PctErr