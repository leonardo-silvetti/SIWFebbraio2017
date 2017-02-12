package it.leonardosilvetti.siwfebbraio2017.service;

import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import java.util.List;

public interface PazienteBO {
    
    public List<Paziente> findAllPazienti();
    
    public Paziente findById(Long id);
    
    public void savePaziente(Paziente paziente);
    
    public void deleteById(Long id);
}
