# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\zavrsni_java\autoskola.sql
drop database if exists lista_polaznika;
create database lista_polaznika;
use lista_polaznika;


create table autoskola(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    mjesto varchar(20) not null,
    adresa varchar(50) not null
);

create table instruktor(
    sifra int not null primary key auto_increment,
    ugovor varchar(50),
    autoskola int,
    osoba int,
    vozilo int
);


create table polaznik(
    osoba int,
    polozeni_propisi boolean not null,
    polozena_prva_pomoc boolean not null,
    broj_odvozenih_sati int not null,
    instruktor int,
    vozilo int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(30) not null,
    prezime varchar(30) not null,
    OIB int,
    mobitel int not null
);

create table vozilo(
    sifra int not null primary key auto_increment,
    registracijska_oznaka varchar(30),
    marka varchar(30),
    boja varchar(20),
    godina_proizvodnje int,
    autoskola int
);


alter table instruktor add foreign key (autoskola) references autoskola(sifra);
alter table instruktor add foreign key (osoba) references osoba(sifra);
alter table polaznik add foreign key (instruktor) references instruktor(sifra);
alter table polaznik add foreign key (osoba) references osoba(sifra);
alter table vozilo add foreign key (autoskola) references autoskola(sifra);
alter table instruktor add foreign key (vozilo) references vozilo(sifra);
alter table polaznik add foreign key (vozilo) references vozilo(sifra);

