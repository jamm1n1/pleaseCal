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

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boardUpdate.do")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일이 multipart/form-data 로 제대로 전송이 됐는지
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024; // 10메가바이트
			
			// 파일 저장하는 폴더 경로 가져와서
			// getRealPath : 절대경로
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			
			// 파일 저장하는 폴더 지정 > 파일 업로드하면 해당 폴더에 들어감
			String savePath = resources + "\\board_upfiles\\";

			System.out.println("savePath : " + savePath); // 찍어보기
			
			// MultipartRequest 객체 생성
			// 일반 request가 아닌 MultipartRequest 객체 생성
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 어떤 게시글 수정할 건지 알아야 하기 때문에
			int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			
			// 게시글 객체 생성해서 수정 내용 담아주기
			Board b = new Board();
			b.setBoardContent(multiRequest.getParameter("content"));
			b.setCategory(multiRequest.getParameter("category"));
			b.setBoardNo(bno);
		
			// 파일 객체 선언
			Attachment at = null;
			
			// 첨부파일 비어있지 않으면 (첨부파일 넣을 거면)
			if(multiRequest.getOriginalFileName("upFile") != null) {
				// 기존 파일명, 시스템 파일명 담아서
				String originName = multiRequest.getOriginalFileName("upFile");
				String changeName = multiRequest.getFilesystemName("upFile");
				//System.out.println("originName : " + originName);
				//System.out.println("changeName : " + changeName);
				
				// 첨부파일 객체 생성해서 set 으로 업데이트
				at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
				
				// 기존에 파일 있었으면 삭제하고 없었으면 insert 해줘야 함
				// 기존에 파일이 있었으면
				if(multiRequest.getParameter("originFile") != null) {
					// 지워줄 파일 담기
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));
					//System.out.println("deleteFile savePath : " + savePath + multiRequest.getParameter("originFile"));
					// 지워주기
					deleteFile.delete();
					// 현재 파일로 set
					//System.out.println("originFileNo : " + multiRequest.getParameter("originFileNo"));
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				// 기존에 파일이 없으면
				} else {
					// 참조 게시글 번호 바로 set
					at.setRefBoardNo(bno);
				}
				
			}
			
			
			
			// 게시글, 파일 넘겨 받은 결과 result에 담아서
			int result = new BoardService().updateBoard(b, at);
			// 업데이트가 잘 되었으면
			if(result > 0) {
				// 해당 게시글 상세 페이지 열기
				response.sendRedirect("boardDetail.do?bno=" + bno);
			} else {
				// 에러메시지 jsp로 전달 - menubar 를 include 해서 가능
				request.setAttribute("msg", "게시글 수정 실패");
				// 에러페이지
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
