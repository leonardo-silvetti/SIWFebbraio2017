package it.leonardosilvetti.siwfebbraio2017.util;

import it.leonardosilvetti.siwfebbraio2017.model.Risultato;
import java.util.ArrayList;
import java.util.List;

public class FormRisultati {

    private List<Risultato> risultati;
    
    public FormRisultati() {
        this.risultati = new ArrayList<Risultato>();
    }

    public List<Risultato> getRisultati() {
        return risultati;
    }

    public void setRisultati(List<Risultato> risultati) {
        this.risultati = risultati;
    }
    
    public void add(Risultato risultato) {
        this.risultati.add(risultato);
    }
}
