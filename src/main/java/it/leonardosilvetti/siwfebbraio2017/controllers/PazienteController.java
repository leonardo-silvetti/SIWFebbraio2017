package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.model.Paziente;
import it.leonardosilvetti.siwfebbraio2017.service.PazienteBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pazienti")
public class PazienteController {
    
    @Autowired
    private PazienteBO pazienteBo;
    
    @RequestMapping("/show")
    public String show(Model model) {
        model.addAttribute("listaPazienti", pazienteBo.findAllPazienti());
        model.addAttribute("pazienteBean", new Paziente());
        return "pazienti";
    }

    @RequestMapping("/save")
    public String save(@ModelAttribute("pazienteBean") Paziente paziente) {
        pazienteBo.savePaziente(paziente);
        return "redirect:"+"show";
    }
    
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        pazienteBo.deleteById(id);
        return "redirect:"+"show";
    }
}
