package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.service.PazienteBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pazienti")
public class PazienteController {
    
    @Autowired
    private PazienteBO pazienteBo;
    
    @RequestMapping("/show")
    public String show(Model model) {
        model.addAttribute("listaPazienti", pazienteBo.findAllPazienti());
        return "pazienti";
    }
}
