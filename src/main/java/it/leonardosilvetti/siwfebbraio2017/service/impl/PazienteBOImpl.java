package it.leonardosilvetti.siwfebbraio2017.service.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.PazienteDAO;
import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import it.leonardosilvetti.siwfebbraio2017.service.PazienteBO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PazienteBOImpl implements PazienteBO {

    @Autowired
    private PazienteDAO pazienteDao;
    
    public List<Paziente> findAllPazienti() {
        return pazienteDao.findAllPazienti();
    }

    public Paziente findById(Long id) {
        return pazienteDao.findById(id);
    }

    public Paziente findByMail(String email) {
        List<Paziente> listaPazienti = pazienteDao.findByMail(email);
        if(listaPazienti.size()>0) {
            return listaPazienti.get(0);
        } else
            return null;
    }
    
    public void savePaziente(Paziente paziente) {
        pazienteDao.savePaziente(paziente);
    }

    public void deleteById(Long id) {
        pazienteDao.deleteById(id);
    } 
}
