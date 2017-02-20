package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.service.TipologiaEsameBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/esami")
public class EsameController {
    
    @Autowired
    private TipologiaEsameBO tipologiaEsameBo;
    
    @RequestMapping("/tipologie/show")
    public String showTipologie(Model model){
        model.addAttribute("listaTipologie", tipologiaEsameBo.findAllTipologie());
        return "tipologie";
    }
}
