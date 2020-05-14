# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\galerijaslika.sql
drop database if exists galerija;
create database galerija;
use galerija;

create table galerija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    mjesto varchar(50),
    slika int,
    autor int

);

create table slika(
    sifra int not null primary key auto_increment,
    opis text,
    autor int,
    tema varchar(50)
);

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    slika int
);


alter table galerija add foreign key (slika) references slika(sifra);
alter table  galerija add foreign key (autor) references autor(sifra);
alter table autor add foreign key (slika) references slika(sifra);
alter table slika add foreign key (autor) references autor(sifra);



