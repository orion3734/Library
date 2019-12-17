package Service;

import DTO.UserDTO;

public interface IUserService {
	public void SignUp(UserDTO dto);
	public int idCheck(String id);
}
