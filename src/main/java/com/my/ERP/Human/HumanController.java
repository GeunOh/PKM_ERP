package com.my.ERP.Human;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HumanController {
	
	
	@RequestMapping("HumanManager")
	public String HumanMain() {
		return "HumanManager";
	}
}
