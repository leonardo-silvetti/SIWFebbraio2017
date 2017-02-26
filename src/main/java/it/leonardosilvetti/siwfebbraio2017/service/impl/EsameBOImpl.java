package it.leonardosilvetti.siwfebbraio2017.service.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.EsameDAO;
import it.leonardosilvetti.siwfebbraio2017.model.Esame;
import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import it.leonardosilvetti.siwfebbraio2017.model.Risultato;
import it.leonardosilvetti.siwfebbraio2017.service.EsameBO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EsameBOImpl implements EsameBO {
    
    @Autowired
    private EsameDAO esameDao;

    public List<Esame> findAllEsami() {
        return esameDao.findAllEsami();
    }

    public Esame findById(Long id) {
        return esameDao.findById(id);
    }

    public List<Esame> findByIdPaziente(Long id) {
        return esameDao.findByIdPaziente(id);
    }
    
    public void saveEsame(Esame esame) {
        esameDao.saveEsame(esame);
    }

    public void saveRisultato(Risultato risultato) {
        esameDao.saveRisultato(risultato);
    }
    
    public void deletById(Long id) {
        esameDao.deletById(id);
    } 
}
