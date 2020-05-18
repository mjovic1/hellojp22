# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\popisKnjiga.sql
drop database if exists popisKnjiga;
create database popisKnjiga;
use popisKnjiga;

create table knjiznica(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    djelatnik int,
    korisnik int,
    radno_vrijeme varchar(50),
    knjiga int

);

create table djelatnik(
    sifra int not null primary key auto_increment,
    knjiznica int,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    ugovor varchar(50),
    datom_pocetka_rada datetime
);

create table korisnik(
    sifra int not null primary key auto_increment,
    knjiznica int,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib int,
    adresa varchar(50)

);


create table knjiga(
    korisnik int,
    knjiznica int,
    naslov varchar(50),
    izdanja varchar(50),
    datum_posudbe datetime,
    cijena_kasnine decimal(8,2)
);

alter table djelatnik add foreign key (knjiznica) references knjiznica(sifra);
alter table korisnik add foreign key (knjiznica) references knjiznica(sifra);
alter table knjiga add foreign key (korisnik) references korisnik(sifra);
alter table knjiga add foreign key (knjiznica) references knjiznica(sifra);


