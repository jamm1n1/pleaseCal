/**
 * 
 */
package com.uni.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * @author imcha
 *
 */
public class MyFileRenamePolicy implements FileRenamePolicy {

	
	@Override
	public File rename(File originFile) { // 받아 오는 매개변수 - 원본 파일명
		
		String originName = originFile.getName();
		
		// 수정명 : 파일 업로드한 시간(년월일시분초) + 10000~99999사이의 랜덤값 (5자리랜덤값) + 확장자
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 날짜 형식 지정
		
		String currentTime = sdf.format(new Date()); // 현재 시간
		
		int ranNum = (int) (Math.random() * 90000 + 10000); // 랜덤값 생성
		
		String ext = ""; // 확장자
		
		int dot = originName.lastIndexOf("."); // 파일명에서 dot 위치
		
		ext = originName.substring(dot); // dot 이후 확장자이기 때문에 변수에 담기
		
		// 파일 이름
		String fileName = currentTime + ranNum + ext;
		
		// 시스템 파일명
		File renameFile = new File(originFile.getParent(), fileName);
		
		return renameFile;
	}

}
