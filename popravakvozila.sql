# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\popravakvozila.sql
drop database if exists popravakvozila;
create database popravakvozila;
use popravakvozila;


create table vozilo(
    sifra int not null primary key auto_increment,
    registracijska_oznaka varchar(20),
    marka varchar(50),
    boja varchar(20),
    godina_proizvodnje datetime,
    korisnik int
);

create table servis(
    sifra int not null primary key auto_increment,
    datum_servisa datetime,
    cijena decimal(10,2),
    broj_servisa_auta int,
    vozilo int,
    korisnik int

);

create table korisnik(
    sifra int not null primary key auto_increment,
    OIB int,
    ime varchar(20),
    prezime varchar(20),
    adresa varchar(30),
    mobitel int
);


alter table vozilo add foreign key (korisnik) references korisnik(sifra);
alter table servis add foreign key (vozilo) references vozilo(sifra);
alter table servis add foreign key (korisnik) references korisnik(sifra);

