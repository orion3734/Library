package DAO;

import DTO.UserDTO;

public interface IUserDAO {
	public void signUp(UserDTO dto);
	public int idCheck(String id);
}
