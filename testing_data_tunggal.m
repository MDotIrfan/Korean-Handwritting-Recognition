if strcmp(file_data, 'seion1.data')
   ciri=ciri1;
elseif strcmp(file_data, 'seion2.data')
   ciri=ciri2;
elseif strcmp(file_data, 'seion3.data')
   ciri=ciri3;
elseif strcmp(file_data, 'seion4.data')
   ciri=ciri4;
elseif strcmp(file_data, 'seion5.data')
   ciri=ciri5;
else
   ciri=ciri6;
end
test1=ciri(:,1:end); %mendapatkan ciri hasil preprocessing
datanormal1 = mapminmax(test1)'; %ciri dinormalisasi
ytst1 = net(datanormal1); %ciri dimasukkan ke jaringan
hasil = vec2ind(ytst1); %hasil dari ciri yang dimasukkan ke jaringan dijadikan index

if hasil == 1
    hasil_huruf='a'
elseif hasil == 2
    hasil_huruf='ba'
elseif hasil == 3
    hasil_huruf='bang'
elseif hasil == 4
    hasil_huruf='bi'
elseif hasil == 5
    hasil_huruf='black'
elseif hasil == 6
    hasil_huruf='bleh'
elseif hasil == 7
    hasil_huruf='bo'
elseif hasil == 8
    hasil_huruf='bu'
elseif hasil == 9
    hasil_huruf='bul'
elseif hasil == 10
    hasil_huruf='cheung'
elseif hasil == 11
    hasil_huruf='chi'
elseif hasil == 12
    hasil_huruf='da'
elseif hasil == 13
    hasil_huruf='dae'
elseif hasil == 14
    hasil_huruf='eo'
elseif hasil == 15
    hasil_huruf='ga'
elseif hasil == 16
    hasil_huruf='gi'
elseif hasil == 17
    hasil_huruf='go'
elseif hasil == 18
    hasil_huruf='gu'
elseif hasil == 19
    hasil_huruf='guk'
elseif hasil == 20
    hasil_huruf='gyo'
elseif hasil == 21
    hasil_huruf='hak'
elseif hasil == 22
    hasil_huruf='han'
elseif hasil == 23
    hasil_huruf='hwa'
elseif hasil == 24
    hasil_huruf='hwi'
elseif hasil == 25
   hasil_huruf='i'
elseif hasil == 26
   hasil_huruf='ja'
elseif hasil == 27
   hasil_huruf='jang'
elseif hasil == 28
   hasil_huruf='jeon'
elseif hasil == 29
   hasil_huruf='ji'
elseif hasil == 30
   hasil_huruf='ki'
elseif hasil == 31
   hasil_huruf='kwang'
elseif hasil == 32
   hasil_huruf='lae'
elseif hasil == 33
   hasil_huruf='li'
elseif hasil == 34
   hasil_huruf='mun'
elseif hasil == 35
   hasil_huruf='no'
elseif hasil == 36
   hasil_huruf='sa'
elseif hasil == 37
   hasil_huruf='seu'
elseif hasil == 38
   hasil_huruf='su'
elseif hasil == 39
   hasil_huruf='yang'
elseif hasil == 40
   hasil_huruf='G'
elseif hasil == 41
   hasil_huruf='N'
elseif hasil == 42
   hasil_huruf='D'
elseif hasil == 43
   hasil_huruf='L'
elseif hasil == 44
   hasil_huruf='M'
elseif hasil == 45
   hasil_huruf='B'
elseif hasil == 46
    hasil_huruf='S'
elseif hasil == 47
    hasil_huruf='Ieung'
elseif hasil == 48
    hasil_huruf='J'
elseif hasil == 49
    hasil_huruf='C'
elseif hasil == 50
    hasil_huruf='K'
elseif hasil == 51
    hasil_huruf='T'
elseif hasil == 52
    hasil_huruf='P'
elseif hasil == 53
    hasil_huruf='H'
elseif hasil == 54
    hasil_huruf='Gg'
elseif hasil == 55
    hasil_huruf='Dd'
elseif hasil == 56
    hasil_huruf='Bb'
elseif hasil == 57
    hasil_huruf='Ss'
elseif hasil == 58
    hasil_huruf='Jj'
elseif hasil == 59
    hasil_huruf='A'
elseif hasil == 60
    hasil_huruf='Ya'
elseif hasil == 61
    hasil_huruf='EO'
elseif hasil == 62
    hasil_huruf='Yeo'
elseif hasil == 63
    hasil_huruf='O'
elseif hasil == 64
    hasil_huruf='Yo'
elseif hasil == 65
    hasil_huruf='U'
elseif hasil == 66
    hasil_huruf='Yu'
elseif hasil == 67
    hasil_huruf='Eu'
elseif hasil == 68
    hasil_huruf='I'
elseif hasil == 69
    hasil_huruf='Ae'
elseif hasil == 70
    hasil_huruf='Yae'
elseif hasil == 71
   hasil_huruf='E'
elseif hasil == 72
   hasil_huruf='Ye'
elseif hasil == 73
   hasil_huruf='Oe'
elseif hasil == 74
   hasil_huruf='Wa'
elseif hasil == 75
   hasil_huruf='Wae'
elseif hasil == 76
   hasil_huruf='Wo'
elseif hasil == 77
   hasil_huruf='We'
elseif hasil == 78
   hasil_huruf='Wi'
elseif hasil == 79
   hasil_huruf='Eui'
end

% Preprocessing;