package com.itwillbs.luna_code.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.itwillbs.luna_code.mapper.UserMapper;
import com.itwillbs.luna_code.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
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
		// userMapper.countNickname(nickname)이 0보다 크면 true(중복)를 반환
		return userMapper.countNickname(nickname) > 0;
	}
}
