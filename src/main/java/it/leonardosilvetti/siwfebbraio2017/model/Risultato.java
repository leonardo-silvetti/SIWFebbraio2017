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
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String risultato;
    
    @ManyToOne
    private IndicatoreEsame indicatoreEsame;
    
    @ManyToOne
    private Esame esame;

    public Risultato() {
    }
    
    public Risultato(IndicatoreEsame indicatoreEsame, Esame esame) {
        this.indicatoreEsame = indicatoreEsame;
        this.esame = esame;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
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

    public Esame getEsame() {
        return esame;
    }

    public void setEsame(Esame esame) {
        this.esame = esame;
    } 
}
