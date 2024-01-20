import random
import datetime

## random date
def random_date(start_year=1935, end_year=2024):
    start_date = datetime.date(start_year, 1, 1)
    end_date = datetime.date(end_year, 12, 31)
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    return start_date + datetime.timedelta(days=random_number_of_days)

# names list
nomi = [
    "Mario", "Luca", "Matteo", "Giovanni", "Roberto",
    "Francesco", "Alessandro", "Marco", "Andrea", "Giuseppe",
    "Riccardo", "Antonio", "Federico", "Michele", "Carlo",
    "Giulia", "Sara", "Martina", "Chiara", "Laura",
    "Anna", "Alessia", "Valentina", "Elena", "Simona",
    "Sofia", "Beatrice", "Gaia", "Giorgia", "Silvia"
]

# surname list
cognomi = [
    "Pomodoro", "Riso", "Pasta", "Polenta", "Olio",
    "Milano", "Roma", "Venezia", "Napoli", "Torino",
    "Chianti", "Barolo", "Prosecco", "Amarone", "Brunello",
    "Garibaldi", "Dante", "Manzoni", "Petrarca", "Tasso",
    "Mela", "Pera", "Arancia", "Limone", "Banana",
    "Genova", "Firenze", "Bologna", "Palermo", "Catania"
]

# number rows to generate
N = 10  

# Creazione del file SQL
with open("insert_partecipanti.sql", "w") as file:
    for i in range(1, N+1):
        nome = random.choice(nomi)
        cognome = random.choice(cognomi)
        data_nascita = random_date()
        tessera = f"B{str(i).zfill(5)}"

        insert_query = f"INSERT INTO partecipanti (part_nome, part_cognome, part_data_nascita, part_tessera) VALUES ('{nome}', '{cognome}', '{data_nascita}', '{tessera}');\n"
        file.write(insert_query)

print("File 'insert_partecipanti.sql' creato con successo!")
