package it.leonardosilvetti.siwfebbraio2017.dao.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.PazienteDAO;
import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PazienteDAOImpl implements PazienteDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    public List<Paziente> findAllPazienti() {
        return sessionFactory.getCurrentSession().createQuery("FROM Paziente").list();
    }

    public Paziente findById(Long id) {
        return (Paziente)sessionFactory.getCurrentSession().get(Paziente.class, id);
    }

    public void savePaziente(Paziente paziente) {
        sessionFactory.getCurrentSession().save(paziente);
    }

    public void deleteById(Long id) {
        Paziente paziente = (Paziente)sessionFactory.getCurrentSession()
                .get(Paziente.class, id);
        sessionFactory.getCurrentSession().delete(paziente);
    } 
}
