package it.leonardosilvetti.siwfebbraio2017.dao.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.TipologiaEsameDAO;
import it.leonardosilvetti.siwfebbraio2017.model.IndicatoreEsame;
import it.leonardosilvetti.siwfebbraio2017.model.PrerequisitoEsame;
import it.leonardosilvetti.siwfebbraio2017.model.TipologiaEsame;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TipologiaEsameDAOImpl implements TipologiaEsameDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    public List<TipologiaEsame> findAllTipologie() {
        return sessionFactory.getCurrentSession().createQuery("FROM TipologiaEsame").list();
    }

    public TipologiaEsame findById(Long id) {
        return (TipologiaEsame)sessionFactory.getCurrentSession().get(TipologiaEsame.class, id);
    }

    public void saveTipologia(TipologiaEsame tipologia) {
        sessionFactory.getCurrentSession().save(tipologia);
    }
    
    public void saveIndicatore(IndicatoreEsame indicatore) {
        sessionFactory.getCurrentSession().save(indicatore);
    }
    
    public void savePrerequisito(PrerequisitoEsame prerequisito) {
        sessionFactory.getCurrentSession().save(prerequisito);
    }
    
    public void deleteById(Long id) {
        TipologiaEsame tipologia = (TipologiaEsame)sessionFactory.getCurrentSession()
                .get(TipologiaEsame.class, id);
        sessionFactory.getCurrentSession().delete(tipologia);
    }
}
