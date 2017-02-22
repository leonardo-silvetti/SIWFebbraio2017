package it.leonardosilvetti.siwfebbraio2017.service.impl;

import it.leonardosilvetti.siwfebbraio2017.dao.TipologiaEsameDAO;
import it.leonardosilvetti.siwfebbraio2017.model.IndicatoreEsame;
import it.leonardosilvetti.siwfebbraio2017.model.PrerequisitoEsame;
import it.leonardosilvetti.siwfebbraio2017.model.TipologiaEsame;
import it.leonardosilvetti.siwfebbraio2017.service.TipologiaEsameBO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TipologiaEsameBOImpl implements TipologiaEsameBO {
    
    @Autowired
    private TipologiaEsameDAO tipologiaEsameDao;

    public List<TipologiaEsame> findAllTipologie() {
        return tipologiaEsameDao.findAllTipologie();
    }

    public TipologiaEsame findById(Long id) {
        return tipologiaEsameDao.findById(id);
    }

    public void saveTipologia(TipologiaEsame tipologia) {
        tipologiaEsameDao.saveTipologia(tipologia);
    }

    public void saveIndicatore(IndicatoreEsame indicatore) {
        tipologiaEsameDao.saveIndicatore(indicatore);
    }

    public void savePrerequisito(PrerequisitoEsame prerequisito) {
        tipologiaEsameDao.savePrerequisito(prerequisito);
    }

    public void deleteById(Long id) {
        tipologiaEsameDao.deleteById(id);
    }
}
