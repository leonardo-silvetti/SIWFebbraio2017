package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.model.IndicatoreEsame;
import it.leonardosilvetti.siwfebbraio2017.model.PrerequisitoEsame;
import it.leonardosilvetti.siwfebbraio2017.model.TipologiaEsame;
import it.leonardosilvetti.siwfebbraio2017.service.TipologiaEsameBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/esami")
public class EsameController {
    
    @Autowired
    private TipologiaEsameBO tipologiaEsameBo;
    
    @RequestMapping(value = {"/tipologie/show", "indicatori/show", "prerequisiti/show"})
    public String showTipologie(Model model){
        model.addAttribute("listaTipologie", tipologiaEsameBo.findAllTipologie());
        model.addAttribute("tipologiaBean", new TipologiaEsame());
        model.addAttribute("indicatoreBean", new IndicatoreEsame());
        model.addAttribute("prerequisitoBean", new PrerequisitoEsame());
        return "tipologie";
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
}
