package com.kh.kmanager.common.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorSettingController {

	
    @RequestMapping("/error404")
    public String Error404(HttpServletResponse res) {
        return "common/404";
    }
    
    @RequestMapping("/error500")
    public String Error500(HttpServletResponse res) {
        return "common/500";
    }
}
