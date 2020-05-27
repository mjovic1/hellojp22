# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\popravakvozila.sql
drop database if exists popravakvozila;
create database popravakvozila;
use popravakvozila;


create table vozilo(
    sifra int not null primary key auto_increment,
    registracijska_oznaka varchar(20) not null,
    marka varchar(50) not null,
    boja varchar(20) not null,
    godina_proizvodnje datetime not null,
    korisnik int not null
);

create table servis(
    sifra int not null primary key auto_increment,
    datum_servisa datetime not null,
    cijena decimal(10,2) not null,
    broj_servisa_auta int,
    vozilo int not null,
    korisnik int not null

);

create table korisnik(
    sifra int not null primary key auto_increment,
    OIB int,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    adresa varchar(30),
    mobitel int not null
);


alter table vozilo add foreign key (korisnik) references korisnik(sifra);
alter table servis add foreign key (vozilo) references vozilo(sifra);
alter table servis add foreign key (korisnik) references korisnik(sifra);

