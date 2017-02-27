package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name = "medici")
public class Medico implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private Long id;
    
    private String nome;
    
    private String cognome;
    
    private String specializzazione;
    
    @OneToMany (mappedBy = "medico", cascade = CascadeType.ALL)
    private List<Esame> esami;

    public Medico() {
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

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getSpecializzazione() {
        return specializzazione;
    }

    public void setSpecializzazione(String specializzazione) {
        this.specializzazione = specializzazione;
    }

    public List<Esame> getEsami() {
        return esami;
    }

    public void setEsami(List<Esame> esami) {
        this.esami = esami;
    }
    
    public String getDescrizioneMedico() {
        return nome +" "+ cognome +" - "+ specializzazione;
    }
}
