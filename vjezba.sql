# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\vjezba.sql
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
    jmbag char(11),
)