package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name = "tipologie_esami")
public class TipologiaEsame implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String nome;
    
    private String codice;
    
    private String descrizione;
    
    private String costo;
    
    @OneToMany(mappedBy="tipologiaEsame", cascade = CascadeType.PERSIST)
    private List<PrerequisitoEsame> prerequisiti;
    
    @OneToMany(mappedBy="tipologiaEsame", cascade = CascadeType.PERSIST)
    private List<Esame> esami;

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

    public String getCodice() {
        return codice;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public List<PrerequisitoEsame> getPrerequisiti() {
        return prerequisiti;
    }

    public void setPrerequisiti(List<PrerequisitoEsame> prerequisiti) {
        this.prerequisiti = prerequisiti;
    }

    public List<Esame> getEsami() {
        return esami;
    }

    public void setEsami(List<Esame> esami) {
        this.esami = esami;
    }
}