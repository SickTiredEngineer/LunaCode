package custom_utills;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DirectoryManager {
	
	/* 첨부파일 업로드를 위한 폴더 생성 함수 */
	public static String createDirectories(String realPath) {
			
			LocalDate today = LocalDate.now();
			String datePattern = "yyyy/MM/dd";
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
			String subDir = today.format(dtf);
			
			realPath += "/" + subDir;
			
			try {
				Path path = Paths.get(realPath);
				Files.createDirectories(path);
				
			}catch (Exception e) {
				e.printStackTrace();
			}

			return subDir;
	}

}
