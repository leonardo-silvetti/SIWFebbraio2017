package it.leonardosilvetti.siwfebbraio2017.dao.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.EsameDAO;
import it.leonardosilvetti.siwfebbraio2017.model.Esame;
import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import it.leonardosilvetti.siwfebbraio2017.model.Risultato;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EsameDAOImpl implements EsameDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    public List<Esame> findAllEsami() {
        return sessionFactory.getCurrentSession().createQuery("FROM Esame").list();
    }

    public Esame findById(Long id) {
        return (Esame)sessionFactory.getCurrentSession().get(Esame.class, id);
    }

    public List<Esame> findByIdPaziente(Long id) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Esame e WHERE e.paziente.id =:param")
                .setLong("param", id).list();
    }
    
    public void saveEsame(Esame esame) {
        sessionFactory.getCurrentSession().save(esame);
    }
    
    public void saveRisultato(Risultato risultato) {
        sessionFactory.getCurrentSession().save(risultato);
    }

    public void deletById(Long id) {
        Esame esame = (Esame)sessionFactory.getCurrentSession().get(Esame.class, id);
        sessionFactory.getCurrentSession().delete(esame);
    }   
}
