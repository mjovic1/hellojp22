# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\autoskola.sql
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
    osoba int
);


create table polaznik(
    osoba int,
    polozeni_propisi boolean not null,
    polozena_prva_pomoc boolean not null,
    broj_odvozenih_sati int not null,
    autoskola int,
    instruktor int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(30) not null,
    prezime varchar(30) not null,
    OIB int,
    mobitel int not null
);


alter table instruktor add foreign key (autoskola) references autoskola(sifra);
alter table instruktor add foreign key (osoba) references osoba(sifra);
alter table polaznik add foreign key (instruktor) references instruktor(sifra);
alter table polaznik add foreign key (autoskola) references autoskola(sifra);
alter table polaznik add foreign key (osoba) references osoba(sifra);