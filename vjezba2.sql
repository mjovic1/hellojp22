# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\vjezba2.sql
drop database if exists vjezba2;
create database vjezba2;
use vjezba2;

create table prijateljica(
    sifra int not null primary key auto_increment,
    dukserica varchar(39),
    eura decimal(14,7),
    treciputa datetime,
    hlace varchar(44),
    zarucnik int
);

create table punac(
    sifra int not null primary key auto_increment,
    suknja varchar(40),
    vesta varchar(49) not null,
    prviputa datetime,
    brat int

);


create table brat(
    sifra int not null primary key auto_increment,
    gustoca decimal(13,7),
    bojaociju varchar(47),
    modelnaocala varchar(47) not null,
    suknja varchar(44),
    maraka decimal(12,10) not null,
    hlaca varchar(48) not null
);


create table neprijateljica(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    vesta varchar(50) not null,
    gustoca decimal(16,8),
    carape varchar(38) not null,
    lipa decimal(18,5) not null,
    prijateljica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    prstena int not null,
    jmbag char(11),
    lipa decimal(17,7) not null,
    eura decimal(17,9) not null,
    neprijateljica int not null
);


create table zarucnik(
    sifra int not null primary key auto_increment,
    indiferentno boolean,
    carapa varchar(38),
    kratkamajica varchar(39),
    ekstrovertno boolean not null,
    narukvica int,
    kuna decimal(14,8)
);

create table punica(
    sifra int not null primary key auto_increment,
    bojaociju varchar(36),
    bojakose varchar(42) not null,
    majica varchar(30),
    prviputa datetime,
    hlace varchar(31),
    asocijalno boolean not null
);

create table zarucnik_punica(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    punica int not null
);


alter table punac add foreign key (brat) references brat(sifra);
alter table svekar add foreign key (neprijateljica) references neprijateljica(sifra);
alter table neprijateljica add foreign key (prijateljica) references prijateljica(sifra);
alter table prijateljica add foreign key (zarucnik) references zarucnik(sifra);
alter table zarucnik_punica add foreign key (zarucnik) references zarucnik(sifra);
alter table zarucnik_punica add foreign key (punica) references punica(sifra);

insert into prijateljica(sifra, dekserica, eura, treciputa, hlace, zarucnik)
values
(null, 'duksa', 1200.00, '2017-06-15', 'plave', null),
(null, 'duksa', 1500.00, '2017-08-11', 'crne', null),
(null, 'duksa', 1450.00, '2017-09-02', 'plave', null);

select * from prijateljica;

insert into neprijateljica(sifra, introvertno, vesta, gustoca, carape, lipa, prijateljica)
values
(null, '1', 'bijela', 3200.00, 'zute', 4000.00, 2),
(null, '1', 'zelena', 3200.00, 'crvene', 4000.00, 3),
(null, '0', 'ljubicasta', 3200.00, 'plave', 4000.00, 1);


insert into zarucnik(sifra, ekstrovertno)
values
(null, 1),
(null, 0),
(null, 1);

insert into punica(sifra, bojakose, asocijalno)
values
(null, 'plava', 1),
(null, 'smeda', 0),
(null, 'crna', 1);

select * from zarucnik;

select * from punica;

insert into zarucnik_punica(sifra, zarucnik, punica)
values
(null, 1, 3),
(null, 2, 1),
(null, 3, 2);

update punac set vesta ='Osijek';

delete from svekar where jmbag = 00000000007;

select treciputa from prijateljica where eura != '6,14' and eura != '19,30' and eura != '40';


