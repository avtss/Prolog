:- dynamic high/2.

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).
high_r(X,Y):- repeat, (high(X,Y) -> (put(32),write(X),nl,write(Y),write("."),nl,
                retract(high(X,Y))) ;X=nil,Y=nil).
pr2:-tell('c:/Prolog/car_brands.txt'),high_r(X,_),X=nil,told.
pr3:-see('c:/Prolog/car_brands.txt'),get0(Sym),read_high(Sym),seen.
read_high(-1):-!.
read_high(_):- read_str(Lang),name(X,Lang),read(Y),asserta(high(X,Y)),
                get0(Sym),read_high(Sym).

% База знаний автомобильных брендов
country(toyota,2).     % 1-Германия 2-Япония 3-США 4-Италия 5-Франция 6-Корея 0-Другая
country(bmw,1).
country(mercedes,1).
country(ford,3).
country(ferrari,4).
country(honda,2).
country(hyundai,6).
country(kia,6).
country(porsche,1).
country(audi,1).
country(lamborghini,4).
country(tesla,3).
country(nissan,2).
country(chevrolet,3).
country(volkswagen,1).
country(lexus,2).
country(subaru,2).
country(mazda,2).
country(peugeot,5).
country(renault,5).
country(bugatti,5).
country(mclaren,0).
country(volvo,0).
country(jaguar,0).
country(land_rover,0).

class(toyota,2).       % 1-Бюджет 2-Средний 3-Премиум 4-Спорт 5-Люкс
class(bmw,3).
class(mercedes,5).
class(ford,2).
class(ferrari,4).
class(honda,2).
class(hyundai,1).
class(kia,1).
class(porsche,4).
class(audi,3).
class(lamborghini,4).
class(tesla,3).
class(nissan,2).
class(chevrolet,2).
class(volkswagen,2).
class(lexus,3).
class(subaru,2).
class(mazda,2).
class(peugeot,2).
class(renault,1).
class(bugatti,5).
class(mclaren,4).
class(volvo,3).
class(jaguar,3).
class(land_rover,5).

engine(toyota,4).      % 1-Бензин 2-Дизель 3-Электро 4-Гибрид 0-Разные
engine(bmw,1).
engine(mercedes,1).
engine(ford,1).
engine(ferrari,1).
engine(honda,4).
engine(hyundai,1).
engine(kia,1).
engine(porsche,1).
engine(audi,1).
engine(lamborghini,1).
engine(tesla,3).
engine(nissan,4).
engine(chevrolet,1).
engine(volkswagen,2).
engine(lexus,4).
engine(subaru,1).
engine(mazda,1).
engine(peugeot,1).
engine(renault,1).
engine(bugatti,1).
engine(mclaren,1).
engine(volvo,4).
engine(jaguar,1).
engine(land_rover,2).

racing(toyota,1).      % 1-Да 0-Нет
racing(bmw,1).
racing(mercedes,1).
racing(ford,1).
racing(ferrari,1).
racing(honda,1).
racing(hyundai,0).
racing(kia,0).
racing(porsche,1).
racing(audi,1).
racing(lamborghini,0).
racing(tesla,0).
racing(nissan,1).
racing(chevrolet,1).
racing(volkswagen,0).
racing(lexus,0).
racing(subaru,1).
racing(mazda,0).
racing(peugeot,0).
racing(renault,1).
racing(bugatti,0).
racing(mclaren,1).
racing(volvo,0).
racing(jaguar,1).
racing(land_rover,0).

market(toyota,4).      % 1-Европа 2-США 3-Азия 4-Глобальный
market(bmw,1).
market(mercedes,4).
market(ford,2).
market(ferrari,4).
market(honda,3).
market(hyundai,4).
market(kia,4).
market(porsche,4).
market(audi,1).
market(lamborghini,4).
market(tesla,4).
market(nissan,4).
market(chevrolet,2).
market(volkswagen,1).
market(lexus,4).
market(subaru,3).
market(mazda,3).
market(peugeot,1).
market(renault,1).
market(bugatti,4).
market(mclaren,4).
market(volvo,1).
market(jaguar,4).
market(land_rover,4).

question1(X1):- write("What is the brand's country of origin?"),nl,
                write("1. Germany"),nl,
                write("2. Japan"),nl,
                write("3. USA"),nl,
                write("4. Italy"),nl,
                write("5. France"),nl,
                write("6. South Korea"),nl,
                write("0. Other"),nl,
                read(X1).

question2(X2):- write("What is the brand's vehicle class?"),nl,
                write("1. Budget"),nl,
                write("2. Mid-range"),nl,
                write("3. Premium"),nl,
                write("4. Sports"),nl,
                write("5. Luxury"),nl,
                read(X2).

question3(X3):- write("What is the primary engine type?"),nl,
                write("1. Gasoline"),nl,
                write("2. Diesel"),nl,
                write("3. Electric"),nl,
                write("4. Hybrid"),nl,
                write("0. Various"),nl,
                read(X3).

question4(X4):- write("Does the brand have racing history?"),nl,
                write("1. Yes"),nl,
                write("0. No"),nl,
                read(X4).

question5(X5):- write("What is the brand's main market?"),nl,
                write("1. Europe"),nl,
                write("2. USA"),nl,
                write("3. Asia"),nl,
                write("4. Global"),nl,
                read(X5).

pr:- question1(X1), question2(X2), question3(X3), question4(X4), question5(X5),
     high(X,X1), class(X,X2), engine(X,X3), racing(X,X4), market(X,X5),
     write("Это: "), write(X), nl.

pr:- write("Couldn't identify your brand."), nl.