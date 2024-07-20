function [black] = IoC(newimage)
%fungsi untuk menghitung banyak piksel hitam pada citra
[rows,columns]=size(newimage);
count=0; %variabel untuk menampung jumlah pixel hitam
for i=1:rows
    for j=1:columns
        if newimage(i,j)==0 %jika pixel yang dpilih adalah pixel hitam
            count=count+1; %variabel count bertambah +1;
        end
    end
end
black=count;
end

