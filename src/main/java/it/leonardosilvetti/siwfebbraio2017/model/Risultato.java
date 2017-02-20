package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "risultati")
public class Risultato implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String risultato;
    
    @ManyToOne
    private IndicatoreEsame indicatoreEsame;

    public String getRisultato() {
        return risultato;
    }

    public void setRisultato(String risultato) {
        this.risultato = risultato;
    }

    public IndicatoreEsame getIndicatoreEsame() {
        return indicatoreEsame;
    }

    public void setIndicatoreEsame(IndicatoreEsame indicatoreEsame) {
        this.indicatoreEsame = indicatoreEsame;
    }
}
