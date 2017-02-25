package it.leonardosilvetti.siwfebbraio2017.model;

import java.io.Serializable;
import java.util.Date;
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
@Table (name = "esami")
public class Esame implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    
    private Date dataPrenotazione;
    
    private Date dataSvolgimento;
    
    @ManyToOne
    private TipologiaEsame tipologiaEsame;
    
    @ManyToOne
    private Paziente paziente;
    
    @ManyToOne
    private Medico medico;
    
    @OneToMany(mappedBy = "esame", cascade = CascadeType.PERSIST)
    private List<Risultato> risultati;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public List<Risultato> getRisultati() {
        return risultati;
    }

    public void setRisultati(List<Risultato> risultati) {
        this.risultati = risultati;
    }
}
