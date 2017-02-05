package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name = "esami")
public class Esame implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String nome;
    
    private Date dataPrenotazione;
    
    private Date dataSvolgimento;
    
    private String risultato;
    
    @ManyToOne
    private TipologiaEsame tipologiaEsame;
    
    @ManyToOne
    private Paziente paziente;
    
    @ManyToOne
    private Medico medico;

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

    public Date getDataPrenotazione() {
        return dataPrenotazione;
    }

    public void setDataPrenotazione(Date dataPrenotazione) {
        this.dataPrenotazione = dataPrenotazione;
    }

    public Date getDataSvolgimento() {
        return dataSvolgimento;
    }

    public void setDataSvolgimento(Date dataSvolgimento) {
        this.dataSvolgimento = dataSvolgimento;
    }

    public String getRisultato() {
        return risultato;
    }

    public void setRisultato(String risultato) {
        this.risultato = risultato;
    }
    
    public TipologiaEsame getTipologiaEsame() {
        return tipologiaEsame;
    }

    public void setTipologiaEsame(TipologiaEsame tipologiaEsame) {
        this.tipologiaEsame = tipologiaEsame;
    }

    public Paziente getPaziente() {
        return paziente;
    }

    public void setPaziente(Paziente paziente) {
        this.paziente = paziente;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }
}
