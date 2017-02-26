package it.leonardosilvetti.siwfebbraio2017.controllers;

import it.leonardosilvetti.siwfebbraio2017.service.PazienteBO;
import it.leonardosilvetti.siwfebbraio2017.util.AdminWrapper;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("userPrincipal")
public class IndexController {
    
    @Autowired
    private PazienteBO pazienteBo;
    
    @RequestMapping(value = {"/", "index"})
    public String index(Model model, Principal principal) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            if(principal.getName().equals("admin@domain.com")) {
                model.addAttribute("userPrincipal", new AdminWrapper("admin"));
            } else {
                model.addAttribute("userPrincipal", pazienteBo.findByMail(principal.getName()));
            }
        }
        
        return "index";
    }
    
    @RequestMapping("/login.html")
    public String login() {
        return "login";
    }
}
