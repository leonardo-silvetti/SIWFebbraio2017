package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.model.Medico;
import it.leonardosilvetti.siwfebbraio2017.service.MedicoBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/medici")
public class MedicoController {
    
    @Autowired
    private MedicoBO medicoBo;
    
    @RequestMapping("/show")
    public String show(Model model) {
        model.addAttribute("listaMedici", medicoBo.findAllMedici());
        model.addAttribute("medicoBean", new Medico());
        return "medici";
    }

    @RequestMapping("/save")
    public String save(@ModelAttribute("medicoBean") Medico medico) {
        medicoBo.saveMedico(medico);
        return "redirect:"+"show";
    }
    
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        medicoBo.deleteById(id);
        return "redirect:"+"show";
    }
}
