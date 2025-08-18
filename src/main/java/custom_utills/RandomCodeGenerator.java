package custom_utills;

import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class RandomCodeGenerator {
	
	
	public static String getRandomCode(int length) {
		
		// 난수 생성방법 
		// 1. java.util.Random 클래스 활용 혹은java.lang.Math 클래스의 random() 메서드
//		Random r = new Random();
//		int rNum = r.nextInt(10000); // 0 ~ 9999
//		Integer.toString(rNum);
		
		// 파라미터로 전달받은 length 값을 자릿수로 활용?
		// (int)Math.pow(10, 4);
		
		
		// 2. 난수 생성에 관한 다양한 기능을 제공하는 라이브러리 제공
		// => Apache의 commons-lang3 라이브러리 추가해서 RandomXXX 클래스 활용
		return RandomStringUtils.randomAlphabetic(length);
	}
	
	

}
