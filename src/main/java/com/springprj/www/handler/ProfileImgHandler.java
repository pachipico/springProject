package com.springprj.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@AllArgsConstructor
@Component
public class ProfileImgHandler {

	private final String UP_DIR = "/Users/jhs/Desktop/ezenSpring/fileUpload";

	public String uploadFile(MultipartFile file) {
		String UP_DIR = "/Users/jhs/Desktop/ezenSpring/profile_img";

		File folders = new File(UP_DIR);
		if (!folders.exists()) {
			folders.mkdirs();
		}

		String originalFileName = file.getOriginalFilename();
		log.debug("originalFileName: {}", originalFileName);
		String onlyFileName = originalFileName.substring(originalFileName.lastIndexOf(File.separator) + 1);
		log.debug("onlyFileName: {}", onlyFileName);

		UUID uuid = UUID.randomUUID();

		String fullFileName = "og_" + uuid.toString() + onlyFileName;
		File storeFile = new File(folders, fullFileName);
		log.debug("업로드할 파일 : {}", storeFile);
		try {
			file.transferTo(storeFile);
			if (isImgFile(storeFile)) {
				File thumbnail = new File(folders, uuid.toString() + "_" + onlyFileName);
				Thumbnails.of(storeFile).size(100, 100).toFile(thumbnail);
			}
		} catch (IllegalStateException e) {
			log.debug(">>> file 생성 오류");
			e.printStackTrace();
		} catch (IOException e) {
			log.debug(">>> file 생성 오류");
			e.printStackTrace();
		}
		log.debug("+++++++++++++{}", folders);
		return fullFileName;
	}

	private boolean isImgFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);
		return mimeType.startsWith("image");
	}

}
