package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name = "prerequisiti_esame")
public class PrerequisitoEsame implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String nome;
    
    private String valore;
    
    @ManyToOne
    private TipologiaEsame tipologiaEsame;

    public PrerequisitoEsame() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getValore() {
        return valore;
    }

    public void setValore(String valore) {
        this.valore = valore;
    }

    public TipologiaEsame getTipologiaEsame() {
        return tipologiaEsame;
    }

    public void setTipologiaEsame(TipologiaEsame tipologiaEsame) {
        this.tipologiaEsame = tipologiaEsame;
    }
}
