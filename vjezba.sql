# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\vjezba.sql
drop database if exists vjezba;
create database vjezba;
use vjezba;


create table sestra(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    hlace varchar(42) not null,
    vesta varchar(41),
    prviputa datetime not null,
    modelnaocala varchar(33),
    becar int
);


create table becar(
    sifra int not null primary key,
    drugiputa datetime not null,
    carape varchar(36),
    bojaociju varchar(46),
    haljina varchar(32)
);


create table ostavljena_snasa(
    sifra int not null primary key auto_increment,
    ostalvjena int not null,
    snasa int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    eura decimal(14,5),
    narukvica int,
    drugiputa datetime not null,
    carape varchar(41)
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    bojaociju varchar(49),
    suknja varchar(31) not null,
    bojakose varchar(45),
    prviputa datetime,
    carape varchar(41)

);

create table mladic(
    sifra int not null primary key auto_increment,
    prstena int not null,
    maraka decimal(15,9) not null,
    suknja varchar(30),
    narukvica int not null,
    ostavljena int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    bojakose varchar(36),
    jmbag char(11) not null,
    prstena int not null,
    dukserica varchar(38),
    mladic int
);

create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno boolean not null,
    vesta varchar(31),
    asocijalno boolean not null,
    prviputa datetime,
    eura decimal(15,6) not null,
    cura int
);

alter table sestra add foreign key (becar) references becar(sifra);
alter table mladic add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena_snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena_snasa add foreign key (snasa) references snasa(sifra);
alter table cura add foreign key (mladic) references mladic(sifra);
alter table punac add foreign key (cura) references cura(sifra);

insert into cura(sifra,bojakose, jmbag, prstena, dukserica)
values
(null, 'plava','421412' , 2, 'dukserica'),
(null, 'smeda', '532523', 1, 'dukserica'),
(null, 'crna', '532525', 1, 'dukserica');

select * from cura;

select * from ostavljena;

insert into ostavljena(sifra, jmbag, bojaociju, suknja, prviputa, carape)
values
(null, '52346436', 'plave', 'crvena', '2015-02-09', 'prugaste'),
(null, '75434575', 'smede', 'bijela', '2017-09-09', 'prugaste'),
(null, '86597643', 'smede', 'crna', '2018-07-11', 'prugaste');

insert into snasa(sifra, eura, narukvica, drugiputa, carape)
values
(null, 300.00, 2, '2019-05-12', 'bijele'),
(null, 400.00, 1, '2019-07-27', 'crne'),
(null, 350.00, 3, '2019-06-11', 'bijele');



insert into mladic(sifra, prstena, maraka, suknja, narukvica, ostavljena)
values
(null, 1, 8000.00, 'nema', 2, 3),
(null, 2, 9500.00, 'nema', 1, 2),
(null, 1, 7800.00, 'nema', 3, 1);

select * from mladic;
select * from ostavljena;
select * from snasa;

insert into ostavljena_snasa(ostavljena, snasa)
values
(2, 1),
(3, 2),
(1, 3);

delete from ostavljena where sifra >=4;

update sestra set hlace='Osijek';

select * from sestra;

delete from punac where vesta != 'AB';

select * from mladic where maraka != '7' and maraka != '11'
and maraka != '18' and maraka != '25' and maraka != '40';



