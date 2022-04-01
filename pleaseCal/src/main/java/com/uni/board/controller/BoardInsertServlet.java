package com.uni.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.board.model.service.BoardService;
import com.uni.board.model.vo.Attachment;
import com.uni.board.model.vo.Board;
import com.uni.common.MyFileRenamePolicy;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/boardInsert.do")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드를 위한 라이브러리 : cos.jar (http://www.servlets.com)
		
		// 파일이 multipart/form-data 로 제대로 전송이 됐는지 조건식으로 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 용량 제한
			int maxSize = 10*1024*1024; // 10 메가바이트
			
			// 파일 저장하는 폴더 넣을 경로 가져와서 담기
			// getRealPath : 절대 경로
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			
			// 파일 저장하는 폴더 지정 > 파일 업로드하면 해당 폴더에 들어감
			String savePath = resources + "\\board_upfiles\\";

			// MultipartRequest 객체 생성
			// 요청, 파일 저장하는 폴더, 파일 용량, 인코딩, 시스템 파일명(new DefaultFileRenamePolicy())
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 카테고리, 제목, 내용 가져오기
			String category = multiRequest.getParameter("category");
			String content = multiRequest.getParameter("content");
			String pwd = multiRequest.getParameter("pwd");
			
			// 로그인 유저
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			
			// 비회원이 게시글 작성할 경우 null로 들어가도록
			String userId = null;
			// 회원인 경우 회원의 아이디 담기
			if(loginUser != null) {
				userId = loginUser.getUserId();
			}/* else {
				userId = "비회원";
			}*/
			
			
			// 게시글 객체 생성
			Board b = new Board();
			
			// set으로 설정
			b.setCategory(category);
			b.setBoardContent(content.replaceAll("\n", "<br>"));
			b.setBoardPwd(pwd);
			b.setBoardWriter(userId);
			
			
			// 첨부파일 객체 생성
			Attachment at = null;
			
			// 첨부파일이 null이 아니면 
			// upfile > input name값
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				// 파일 원본명
				String originName = multiRequest.getOriginalFileName("upfile");
				
				// 시스템 파일명
				String changeName = multiRequest.getFilesystemName("upfile");
				
				// 첨부파일 객체 생성해서 담아주기
				at = new Attachment();
				// set 으로 지정
				at.setFilePath(savePath); // 파일 저장 경로
				at.setOriginName(originName);
				at.setChangeName(changeName);
			}
			
			
			// 게시글과 첨부파일 넘겨서 리턴 받은 결과 result 에 담기
			int result = new BoardService().insertBoard(b, at);
			
			// 등록이 잘 되었다면
			if(result > 0) {
				// 성공 메시지 출력
				request.setAttribute("msg", "게시글 등록 성공");
				// 게시글 목록으로 돌아가기 - url 변경
				response.sendRedirect("boardList.do");

			// 실패 시
			} else {
				
				// 파일 업로드 시도가 먼저 되고 있기 때문에 실패했어도 파일은 업로드 될 것
				// 따라서 지워줘야 함
				if(at != null) {
					// 해당 파일 담아서
					// 시스템 파일명으로 바뀐 이름이 올라가 있기 때문에
					File failedFile = new File(savePath + at.getChangeName());
					// 삭제하기
					failedFile.delete();
				}
				
				// 에러 메시지 띄우기
				request.setAttribute("msg", "게시글 등록 실패");
				// 에러 페이지
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

			}

		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
