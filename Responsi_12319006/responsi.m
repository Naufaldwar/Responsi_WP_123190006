opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = [3 4 5 8];
data = readmatrix('Real estate valuation data set.xlsx',opts);
k = [0,0,1,0];
w = [3,5,4,1];
        
%tahapan pertama, perbaikan bobot

w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:4,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:50,
    S(i)=prod(data(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S);
[m,n] = max([V]);%mencari nilai tertinggi 

%menampilkan ke command window
disp(m);
disp(n);


