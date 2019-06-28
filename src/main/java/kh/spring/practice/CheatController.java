package kh.spring.practice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheatController {
	@RequestMapping("cheatGo")
	public String cheatGo() {
		return "cheat";
	}
	
}
