%menampung karakter apa saja yang ada di dataset
test = ["a","ba",'bang','bi','black','bleh','bo','bu','bul','cheung','chi','da','dae','eo','ga','gi','go','gu','guk','gyo','hak','han','hwa','hwi','i','ja','jang','jeon','ji','ki','kwang','lae','li','mun','no','sa','seu','su','yang','G','N','D','R','M','B','S','Ieung','J','C','K','T','P','H','Gg','Dd','Pp','Ss','Jj','A','Ya','Eo','Yeo','O','Yo','U','Yu','Eu','I','Ae','Yae','E','Ye','Oe','Wa','Wae','Wo','We','wi','Eui'];
%menampung ekstraksi ciri per gambar
cell_feature = [];
%variabel jumlah kelas
class = 79;
%variabel gambar per kelas
img_per_class = 55;
%memanggil progress bar
PB = waitbar(0, '1', 'Name', 'Mengekstraksi Ciri',...
    'CreateCancelBtn',...
    'setappdata(gcbf, ''canceling'', 1)');
%men set variable canceling menjadi 0
setappdata(PB, 'canceling', 0)
for m=1:79 %perulangan sejumlah kelas
    ak = test(m); %mengambil karakter kelas dari matriks test
    disp(ak); %menampilkan karakter apa yang sedang dieksrak
     if getappdata(PB, 'canceling') %jika tombol cancel ditekan
        break %maka perulangan dihentikan
     end
        for i=1:img_per_class %perulangan sejumlah banyak gambar per karakter
            waitbar(m/79, PB, sprintf( 'Mengekstraksi Ciri Karakter %s (%d/%d)', num2str(ak), i, img_per_class)); %tulisan di progress bar, num2str(ak) itu variabel karakternya, i itu gambar ke berapa, img_per_class itu total gambar per kelas
            image_{i}= imread(sprintf('dataset fix banget/Data Training/%s/%s%s.jpg',num2str(m),num2str(ak),num2str(i))); %koding membaca gambar
            %mengubah representasi citra dari citra berwarna ke citra keabuan
grayimage=rgb2gray(image_{i});
%mengubah representasi citra dari citra keabuan ke citra hitam putih
image2=im2bw(grayimage);
%mengubah ukuran dimensi citra menjadi ukuran 42x42 piksel
resized_bw = imresize(image2, [42 42]);
%menipiskan citra menggunakan Rosenfeld
thin=Rosenfeld(resized_bw);
%membagi citra menjadi 9 segmen berukuran 14x14 piksel
[im1,im2,im3,im4,im5,im6,im7,im8,im9]=divide(thin);
            %mencirikan citra menggunakan mark direction pada tiap segmen
            [vert_1,horz_1,dig1_1,dig2_1] = MarkDirection(im1);
            [vert_2,horz_2,dig1_2,dig2_2] = MarkDirection(im2);
            [vert_3,horz_3,dig1_3,dig2_3] = MarkDirection(im3);
            [vert_4,horz_4,dig1_4,dig2_4] = MarkDirection(im4);
            [vert_5,horz_5,dig1_5,dig2_5] = MarkDirection(im5);
            [vert_6,horz_6,dig1_6,dig2_6] = MarkDirection(im6);
            [vert_7,horz_7,dig1_7,dig2_7] = MarkDirection(im7);
            [vert_8,horz_8,dig1_8,dig2_8] = MarkDirection(im8);
            [vert_9,horz_9,dig1_9,dig2_9] = MarkDirection(im9);
            %mencirikan citra menggunakan Intensity of Character pada tiap segmen
            [black_1] = IoC(im1);
            [black_2] = IoC(im2);
            [black_3] = IoC(im3);
            [black_4] = IoC(im4);
            [black_5] = IoC(im5);
            [black_6] = IoC(im6);
            [black_7] = IoC(im7);
            [black_8] = IoC(im8);
            [black_9] = IoC(im9);
            %memasukkan ciri black ke array black
            black=[black_1,black_2,black_3,black_4,black_5,black_6,black_7,black_8,black_9];
            %memasukkan ciri dig1 ke array dig1
            dig1=[dig1_1,dig1_2,dig1_3,dig1_4,dig1_5,dig1_6,dig1_7,dig1_8,dig1_9];
            %memasukkan ciri dig2 ke array dig2
            dig2=[dig2_1,dig2_2,dig2_3,dig2_4,dig2_5,dig2_6,dig2_7,dig2_8,dig2_9];
            %memasukkan ciri horz ke array horz
            horz=[horz_1,horz_2,horz_3,horz_4,horz_5,horz_6,horz_7,horz_8,horz_9];
            %memasukkan ciri vert ke array vert
            vert=[vert_1,vert_2,vert_3,vert_4,vert_5,vert_6,vert_7,vert_8,vert_9];
            %membuat kombinasi ciri 6
            ciri6=[black,dig1,dig2,horz,vert];
            %x = ['job done for image ',num2str(ak),' - ',num2str(i),'/20'];
            %disp(x);
            cell_feature(i,:) = [m,ciri6]; %menggabungkan dan menampung ciri per gambar dengan label
        end
       cek{m} = cell_feature; %menampung ciri per karakter
       dataset(m,:) = cek(m)'; %men transpose matrik cek
       data = cell2mat(dataset); %memasukkan hasil transpose ke database
end
namafiledata = 'dataset.csv'; %koding untuk nama file dataset
csvwrite(namafiledata,data); %menulis data hasil ekstraksi ciri ke file csv
delete(PB); %untuk menutup progress bar / loading screen