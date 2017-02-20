package it.leonardosilvetti.siwfebbraio2017.dao;

import it.leonardosilvetti.siwfebbraio2017.model.TipologiaEsame;
import java.util.List;

public interface TipologiaEsameDAO {
    
    public List<TipologiaEsame> findAllTipologie();
    
    public TipologiaEsame findById(Long id);
    
    public void saveTipologia(TipologiaEsame tipologia);
    
    public void deleteById(Long id);  
}
