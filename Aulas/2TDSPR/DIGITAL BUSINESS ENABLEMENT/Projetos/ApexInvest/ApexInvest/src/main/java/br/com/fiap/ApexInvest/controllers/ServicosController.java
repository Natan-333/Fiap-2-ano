package br.com.fiap.ApexInvest.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.fiap.ApexInvest.controllers.model.Servicos;

@RestController
public class ServicosController {
    
    @GetMapping("/Servicos")
    public Servicos index(){
        Servicos servicos = new Servicos("0001", "0002", "Jossef", "5000");
        return servicos;
        
    }
}
