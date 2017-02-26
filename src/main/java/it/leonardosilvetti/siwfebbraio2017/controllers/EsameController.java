package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.model.Esame;
import it.leonardosilvetti.siwfebbraio2017.model.IndicatoreEsame;
import it.leonardosilvetti.siwfebbraio2017.model.PrerequisitoEsame;
import it.leonardosilvetti.siwfebbraio2017.model.Risultato;
import it.leonardosilvetti.siwfebbraio2017.model.TipologiaEsame;
import it.leonardosilvetti.siwfebbraio2017.service.EsameBO;
import it.leonardosilvetti.siwfebbraio2017.service.MedicoBO;
import it.leonardosilvetti.siwfebbraio2017.service.PazienteBO;
import it.leonardosilvetti.siwfebbraio2017.service.TipologiaEsameBO;
import it.leonardosilvetti.siwfebbraio2017.util.FormRisultati;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/esami")
public class EsameController {
    
    @Autowired
    private TipologiaEsameBO tipologiaEsameBo;
    
    @Autowired
    private EsameBO esameBo;
    
    @Autowired
    private MedicoBO medicoBo;
    
    @Autowired
    private PazienteBO pazienteBo;
    
    @RequestMapping(value = {"/tipologie/show", "indicatori/show", "prerequisiti/show"})
    public String showTipologie(Model model){
        model.addAttribute("listaTipologie", tipologiaEsameBo.findAllTipologie());
        model.addAttribute("tipologiaBean", new TipologiaEsame());
        model.addAttribute("indicatoreBean", new IndicatoreEsame());
        model.addAttribute("prerequisitoBean", new PrerequisitoEsame());
        return "tipologie";
    }
    
    @RequestMapping(value = {"appuntamenti/show", "risultati/show"})
    public String showAppuntamenti(Model model) {
        model.addAttribute("listaEsami", esameBo.findAllEsami());
        return "appuntamenti";
    }
    
    @RequestMapping("/imieiesami/show")
    public String showEsami(@RequestParam("id") Long id, Model model) {
        model.addAttribute("listaEsamiPaziente", esameBo.findByIdPaziente(id));
        return "imieiesami";
    }
    
    @RequestMapping("/tipologie/save")
    public String saveTipologia(@ModelAttribute ("tipologiaBean") TipologiaEsame tipologia) {
        tipologiaEsameBo.saveTipologia(tipologia);
        return "redirect:"+"show";
    }
    
    @RequestMapping("/indicatori/save")
    public String saveIndicatore(@ModelAttribute ("indicatoreBean") IndicatoreEsame indicatore) {
        tipologiaEsameBo.saveIndicatore(indicatore);
        return "redirect:"+"show";
    }
    
    @RequestMapping("/prerequisiti/save")
    public String savePrerequisito(@ModelAttribute ("prerequisitoBean") PrerequisitoEsame prerequisito) {
        tipologiaEsameBo.savePrerequisito(prerequisito);
        return "redirect:"+"show";
    }
    
    @RequestMapping("/appuntamenti/save")
    public String saveEsame(@ModelAttribute ("esameBean") Esame esame) {
        esame.setDataPrenotazione(new Date());
        esameBo.saveEsame(esame);
        return "redirect:"+"show";
    }
    
    @RequestMapping("risultati/save")
    public String saveRisultati(@ModelAttribute("risultatiBean") FormRisultati risultati) {
        for (Risultato r: risultati.getRisultati()) {
            esameBo.saveRisultato(r);
        }
        return "redirect:"+"show";
    }
    
    @RequestMapping("/appuntamenti/new")
    public String newAppuntamento(Model model) {
        model.addAttribute("listaPazienti", pazienteBo.findAllPazienti());
        model.addAttribute("listaMedici", medicoBo.findAllMedici());
        model.addAttribute("listaTipologie", tipologiaEsameBo.findAllTipologie());
        model.addAttribute("esameBean", new Esame());
        return "nuovoesame";
    }
    
    @RequestMapping("/risultati/new")
    public String newRisultati(@RequestParam("id") Long id, Model model) {
        Esame esame = esameBo.findById(id);
        if(esame.getRisultati()==null || esame.getRisultati().isEmpty()) {
            model.addAttribute("esame", esame);
            model.addAttribute("risultatiBean", initializeForm(esame));
            return "inseriscirisultati";
        } else {
            model.addAttribute("name", "Impossibile procedere");
            model.addAttribute("message",
                    "Per l'esame selezionato sono già stati inseriti i risultati!");
            return "exception";
        }
    }
    
    @RequestMapping("/tipologie/delete")
    public String deleteTipologia(@RequestParam("id") Long id) {
        tipologiaEsameBo.deleteById(id);
        return "redirect:"+"show";
    }
    
    @RequestMapping("/appuntamenti/delete")
    public String deleteAppuntamento(@RequestParam("id") Long id) {
        esameBo.deletById(id);
        return "redirect:"+"show";
    }
    
    private FormRisultati initializeForm(Esame esame) {
        FormRisultati risultati = new FormRisultati();
        List<IndicatoreEsame> indicatori = esame.getTipologiaEsame().getIndicatori();
        for(IndicatoreEsame i: indicatori) {
            risultati.add(new Risultato(i, esame));
        }
        return risultati;
    } 
}
