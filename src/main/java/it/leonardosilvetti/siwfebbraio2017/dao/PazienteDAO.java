package it.leonardosilvetti.siwfebbraio2017.dao;

import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import java.util.List;

public interface PazienteDAO {
    
    public List<Paziente> findAllPazienti();
    
    public Paziente findById(Long id);
    
    public List<Paziente> findByMail(String email);
    
    public void savePaziente(Paziente paziente);
    
    public void deleteById(Long id);
}
