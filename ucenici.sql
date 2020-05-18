# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\ucenici.sql
drop database if exists lista_ucenika;
create database lista_ucenika;
use lista_ucenika;

create table skola(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50),
    mjesto varchar(30)
);

create table ucenik(
    osoba int,
    razred varchar(10),
    razrednik int,
    prosjek_ocjena decimal(3,2),
    skola int
);

create table razrednik(
    sifra int not null primary key auto_increment,
    osoba int,
    ugovor varchar(50) not null,
    predmet varchar(50),
    skola int
);


create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(30) not null,
    mobitel int not null
);


alter table ucenik add foreign key (skola) references skola(sifra);
alter table ucenik add foreign key (razrednik) references razrednik(sifra);
alter table ucenik add foreign key (osoba) references osoba(sifra);
alter table razrednik add foreign key (skola) references skola(sifra);






