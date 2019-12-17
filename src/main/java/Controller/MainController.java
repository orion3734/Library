package Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import DTO.UserDTO;
import Service.UserServiceImpl;

@Controller
public class MainController {
	@Autowired
	UserServiceImpl userService;

	@GetMapping("/")//메인페이지
	public String Main() {
		return "home";
	}
	@GetMapping("signUpPage")//회원가입페이지
	public String sinUpPage() {
		return "signUp";
	}
	@GetMapping("idCheck")//아이디 중복확인
	public @ResponseBody int idCheck(@RequestParam("userId")String id) {
		int cnt=userService.idCheck(id);
		return cnt;
	}

	@PostMapping("/signUp")//회원가입
	public String signUp(UserDTO dto) {
		userService.SignUp(dto);
		return "redirect:/";
	}
	
}
