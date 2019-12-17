package DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import DTO.UserDTO;

@Repository
public class UserDAOImpl implements IUserDAO {
	@Inject
	private SqlSession sqlSession;
	@Override
	public void signUp(UserDTO dto) {
		sqlSession.insert("userMapper.signUp", dto);
	}
	@Override
	public int idCheck(String id) {
		int cnt=sqlSession.selectOne("userMapper.idCheck", id);
		return cnt;
	}
	
}
