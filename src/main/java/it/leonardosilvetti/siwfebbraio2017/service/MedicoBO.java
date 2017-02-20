package it.leonardosilvetti.siwfebbraio2017.service;

import it.leonardosilvetti.siwfebbraio2017.model.Medico;
import java.util.List;

public interface MedicoBO {
    
    public List<Medico> findAllMedici();
    
    public Medico findById(Long id);
    
    public void saveMedico(Medico medico);
    
    public void deleteById(Long id);
}
