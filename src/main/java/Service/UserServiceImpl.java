package Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.UserDAOImpl;
import DTO.UserDTO;

@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	UserDAOImpl userDAO;
	
	//회원가입
	@Override
	public void SignUp(UserDTO dto) {
			userDAO.signUp(dto);
	}
	//아이디 중복확인
	@Override
	public int idCheck(String id) {
		int cnt=userDAO.idCheck(id);
		return cnt;
	}
}
