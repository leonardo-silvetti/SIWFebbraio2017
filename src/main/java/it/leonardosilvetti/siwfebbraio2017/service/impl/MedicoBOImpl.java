package it.leonardosilvetti.siwfebbraio2017.service.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.MedicoDAO;
import it.leonardosilvetti.siwfebbraio2017.model.Medico;
import it.leonardosilvetti.siwfebbraio2017.service.MedicoBO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MedicoBOImpl implements MedicoBO{
    
    @Autowired
    private MedicoDAO medicoDao;

    public List<Medico> findAllMedici() {
        return medicoDao.findAllMedici();
    }

    public Medico findById(Long id) {
        return medicoDao.findById(id);
    }

    public void saveMedico(Medico medico) {
        medicoDao.saveMedico(medico);
    }

    public void deleteById(Long id) {
        medicoDao.deleteById(id);
    }  
}
