package it.leonardosilvetti.siwfebbraio2017.dao;

import it.leonardosilvetti.siwfebbraio2017.model.Esame;
import it.leonardosilvetti.siwfebbraio2017.model.Risultato;
import java.util.List;

public interface EsameDAO {
    
    public List<Esame> findAllEsami();
    
    public Esame findById(Long id);
    
    public void saveEsame (Esame esame);
    
    public void saveRisultato (Risultato risultato);
    
    public void deletById(Long id);
}
