package com.itwillbs.luna_code.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.itwillbs.luna_code.mapper.UserMapper;
import com.itwillbs.luna_code.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 사용자 프로필 정보 조회
	public UserVO getUserProfile(String userId) {
		return userMapper.selectUserProfile(userId);
	}
	
	// 사용자 프로필 정보 업데이트 (파일 처리 포함)
	@Transactional(rollbackFor = Exception.class)
	public void updateUserProfile(UserVO vo, MultipartFile profileImage, HttpServletRequest request) throws Exception {
		
		if (profileImage != null && !profileImage.isEmpty()) {
			try {
				String uploadDir = "/resources/uploads/profiles/";
				String realPath = request.getServletContext().getRealPath(uploadDir);

				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				String originalFilename = profileImage.getOriginalFilename();
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String savedFilename = UUID.randomUUID().toString() + extension;

				profileImage.transferTo(new File(realPath, savedFilename));
				
				vo.setProfile_img(uploadDir + savedFilename);

			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("프로필 이미지 저장에 실패했습니다.");
			}
		}

		int updateCount = userMapper.updateUserProfile(vo);
		
		if (updateCount == 0) {
			throw new Exception("프로필 정보 업데이트에 실패했습니다.");
		}
	}
	
	// 닉네임 중복 확인을 위한 메소드
	public boolean isNicknameDuplicate(String nickname) {
		// 0보다 크면 true(중복)를 반환
		return userMapper.countNickname(nickname) > 0;
	}
	
	// 이메일 중복 확인을 위한 메소드
	public boolean isEmailDuplicate(String email) {
		// 0보다 크면 true(중복)를 반환
		return userMapper.countEmail(email) > 0;
	}
	
	// 현재 비밀번호가 맞는지 확인하는 메소드
	public boolean isPasswordCorrect(String userId, String currentPass) {
		// 현재 비밀번호를 가져옴
		String encryptedPasswordFromDB  = userMapper.selectPassword(userId);
		
		if (encryptedPasswordFromDB == null) {
			return false; // 사용자가 존재하지 않는 경우
		}
		
		// 비밀번호 비교
		return passwordEncoder.matches(currentPass, encryptedPasswordFromDB);
	}
	
	// 새 비밀번호로 업데이트하는 메소드
	@Transactional(rollbackFor = Exception.class)
	public boolean updateNewPassword(String userId, String currentPass, String newPass) throws Exception {
		// 현재 비밀번호 확인
		if (!isPasswordCorrect(userId, currentPass)) {
			return false; // 현재 비밀번호가 틀리면 false 반환
		}
		
		String encryptedNewPassword = passwordEncoder.encode(newPass);
		
		// Mapper로 전달
		int updateCount = userMapper.updatePassword(userId, encryptedNewPassword);

		if (updateCount == 0) {
			// 업데이트가 실패하면 예외 발생시켜 롤백
			throw new Exception("비밀번호 업데이트에 실패했습니다.");
		}
		
		return true; // 성공 시 true 반환
	}

	// 계정 탈퇴 처리 메소드
	@Transactional(rollbackFor = Exception.class)
	public boolean deleteUserAccount(String userId, String password) throws Exception {
		// 현재 비밀번호 확인
		if (!isPasswordCorrect(userId, password)) {
			return false; // 비밀번호가 틀리면 탈퇴 실패
		}

		// 계정 정보 삭제
		int deleteCount = userMapper.deleteUser(userId);

		if (deleteCount == 0) {
			// 삭제된 행이 없으면 예외를 발생시켜 롤백 처리
			throw new Exception("계정 삭제에 실패했습니다.");
		}
		
		return true; // 성공 시 true 반환
	}
}
