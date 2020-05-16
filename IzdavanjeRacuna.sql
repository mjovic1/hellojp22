# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\IzdavanjeRacuna.sql
drop database if exists racun;
create database racun;
use racun;


create table broj_fakture(
    sifra int not null primary key auto_increment,
    roba int,
    dobavljac int,
    jedinicna_cijena decimal(8,2),
    jedinicna_kolicina int
    
);


create table roba(
    naziv_robe varchar(50) not null,
    kolicina int,
    materijal varchar(50) not null,
    broj_fakture int,
    dobavljac int

);


create table dobavljac(
    sifra int not null primary key auto_increment,
    broj_fakture int,
    naziv_dobavljaca varchar(50) not null,
    mjesto varchar(50) not null,
    ziro_racun varchar(20),
    mobitel int not null
);

alter table broj_fakture add foreign key (dobavljac) references dobavljac(sifra);
alter table roba add foreign key (broj_fakture) references broj_fakture(sifra);
alter table roba add foreign key (dobavljac) references dobavljac(sifra);
