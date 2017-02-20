package it.leonardosilvetti.siwfebbraio2017.dao.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.MedicoDAO;
import it.leonardosilvetti.siwfebbraio2017.model.Medico;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MedicoDAOImpl implements MedicoDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    public List<Medico> findAllMedici() {
        return sessionFactory.getCurrentSession().createQuery("FROM Medico").list();
    }

    public Medico findById(Long id) {
        return (Medico)sessionFactory.getCurrentSession().get(Medico.class, id);
    }

    public void saveMedico(Medico medico) {
        sessionFactory.getCurrentSession().save(medico);
    }

    public void deleteById(Long id) {
        Medico medico = (Medico)sessionFactory.getCurrentSession()
                .get(Medico.class, id);
        sessionFactory.getCurrentSession().delete(medico);
    }
}
