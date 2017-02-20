package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name = "indicatori_esami")
public class IndicatoreEsame implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String nome;
    
    @OneToMany(mappedBy = "indicatoreEsame", cascade = CascadeType.PERSIST)
    private List<Risultato> risultato;
    
    @ManyToOne
    private TipologiaEsame tipologiaEsame;

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

    public List<Risultato> getRisultato() {
        return risultato;
    }

    public void setRisultato(List<Risultato> risultato) {
        this.risultato = risultato;
    }
    
    public TipologiaEsame getTipologiaEsame() {
        return tipologiaEsame;
    }

    public void setTipologiaEsame(TipologiaEsame tipologiaEsame) {
        this.tipologiaEsame = tipologiaEsame;
    }
}
