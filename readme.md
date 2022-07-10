Skrypt do stworzenia bazy danych: library.sql
Konfiguracja połączenia z bazą danych: application.yml
Domyślny connector bazy danych: mysql, zmiany należy dokonać w pom.xml oraz zmienić dialect w application.yml

Konta: login/haslo

	   admin/admin
	   user1/user1
	   user2/user2
	   user3/user3


Opis funkconalności:

	-Użytkownik:
		rejestracja
		logowanie
		przeglądanie książek
		dodawanie do książek do koszyka
		przeglądanie swojego koszyka
		usuwamie książek z koszyka
		zamawianie książek z koszyka
		sprawdznie statusu zamówienia
		
	-Adminstrator:
		rejestracja kolejnych administratorów (/adminregister)
		logowanie
		Dodawanie/usuwanie/edycja autorów
		Dodawanie/usuwanie/edycja kategorii
		Dodawanie/usuwanie/edycja książek
		Zmiana statusu zamówienia użytkowników
	
		
