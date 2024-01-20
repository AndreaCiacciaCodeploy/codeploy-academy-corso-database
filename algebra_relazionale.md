
# ALGEBRA RELAZIONALE

L’algebra relazionale è basata su concetti di tipo algebrico. 
Sostanzialmente questo linguaggio è costituito da un insieme di operatori, definiti su relazioni, che producono ancora relazioni come risultati.

Alcune operazioni dell'algerba relazinoale le possiamo provare tramite il seguente tool online
https://dbis-uibk.github.io/relax/landing

Get Started > Group Editor

Inseriamo la struttura di seguito indicata, successivamente: preview > use group in editor
```
group: corso_database 

Persone = {
id:string, nome:string, cognome:string, anno:number
A01, andrea, rossi, 1987
A02, mario, verdi, 1965
A03, marco, gialli, 1976
}

Artisti = {
id:string, nome:string, cognome:string, anno:number
B01, sarah, blu, 1985
B02, pino, neri, 1945
B03, francesca, marrone, 1996
B03, francesca, marrone, 1976
}
```
Dopo aver importato il database possiamo scrivere le nostre operazioni algebriche.
Alcune qui indicate

## operatori

### selezione
σanno=1987Persone

### proiezione
π nome,cognome ( Persone )

### selezione e proiezione
π nome, cognome ( σ anno = 1987 Persone )

### prodotto cartesiano
Persone ⨯ Artisti

### join
ρ p Persone ⨝ p.anno = a.anno ρ a Artisti

### unione
ρ p Persone ∪ ρ a Artisti

### differenza
ρ p Persone - ρ a Artisti