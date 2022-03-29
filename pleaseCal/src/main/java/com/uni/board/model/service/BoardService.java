package com.uni.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.uni.common.JDBCTemplate.*;

import com.uni.board.model.dao.BoardDao;
import com.uni.board.model.vo.Attachment;
import com.uni.board.model.vo.Board;
import com.uni.common.model.vo.PageInfo;
import com.uni.board.model.vo.Reply;

public class BoardService {
	
	// 총 게시글 개수 카운트하는 메소드
	public int getListCount() {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		// 총 게시글 개수 반환하기 위해
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 전체 조회하는 메소드
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	// 게시글 등록하는 메소드
	public int insertBoard(Board b, Attachment at) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		// 게시글 등록할 Board 객체 넘겨 받은 결과 담기
		int result1 = new BoardDao().insertBoard(conn, b);
		
		// 첨부파일
		int result2 = 1; // 0 이면 결과 무조건 0이기 떼문에 1 이상이면 됨
		
		// 첨부파일 등록한 경우
		if(at != null) {
			// 첨부파일 넘겨 받은 결과 담기
			result2 = new BoardDao().insertAttachment(conn, at);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	// 게시글 하나 가져오는 메소드
	public Board selectBoard(int bno) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		// 조회수 증가시키는 메소드로
		int result = new BoardDao().increaseCount(conn, bno);
		
		// 해당 게시글 받을 객체
		Board b = null;
		
		// 조회수 잘 올라갔으면
		if(result > 0) {
			commit(conn); // 커밋하고
			// 객체 가져와서 담기
			b = new BoardDao().selectBoard(conn, bno);
			//System.out.println("b service : " + b);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}
	
	// 해당 게시글 첨부파일 가져오는 메소드
	public Attachment selectAttachment(int bno) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		Attachment at = new BoardDao().selectAttachment(conn, bno);
		
		close(conn);
		
		return at;
	}
	
	// 게시글 댓글 가져오는 메소드
	public ArrayList<Reply> selectRList(int bno) {
		
		Connection conn = getConnection(); // 커넥션 연결

		// 댓글 여러 개일 수도 있으니 list에 담기 - conn, 게시판 id 넘겨서 리턴 받은 결과
		ArrayList<Reply> list = new BoardDao().selectRList(conn, bno);
		
		close(conn);
		
		return list;
	}
	
	// 댓글 등록하는 메소드
	public int insertReply(Reply re) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		int result = new BoardDao().insertReply(conn, re);
		
		// 둘 다 진행 잘 되었으면
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	// 게시글 업데이트 하는 메소드
	public int updateBoard(Board b, Attachment at) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		// 게시글 업데이트 먼저 > 넘겨 받은 결과 result1 에 담아서
		int result1 = new BoardDao().updateBoard(conn, b);
		// 첨부파일 업데이트 결과 받을 변수 선언
		int result2 = 1; // 곱해도 0 안 나오게 (1 이상이도록)
		
		// 수정할 파일이 있고
		if(at != null) {
			// 파일 번호가 0이 아니라면
			if(at.getFileNo() != 0) {
				result2 = new BoardDao().updateAttachment(conn, at);
			// 없으면 insert
			} else {
				result2 = new BoardDao().insertAttachment(conn, at);
			}
		}
		
		// 둘 다 진행이 잘 되었으면
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	// 게시글 삭제하는 메소드 (상태값 n으로)
	public int deleteBoard(int bno) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		/* 트리거 생성으로 필요 없어짐
		// 넘겨 받은 결과 result에 담아서
		int bResult = new BoardDao().deleteBoard(conn, bno);
		
		// 첨부파일 없는 경우를 위해서
		int aResult = 1;
		
		// 댓글 없는 경우를 위해
		int reResult = 1;
		
		// 첨부파일이 있다면
		if(at != null) {
			aResult = new BoardDao().deleteAttachment(conn, bno);
		}
		
		// 댓글이 있다면
		if(!reList.isEmpty()) {
			reResult = new BoardDao().deleteReply(conn, bno);
		}
		
		if(bResult * aResult * reResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return bResult * aResult * reResult;*/
		
		int result = new BoardDao().deleteBoard(conn, bno);
		
		// 삭제할 게 있고 성공적으로 되었으면
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	// 회원 본인이 작성한 게시글 조회
	public ArrayList<Board> boardSelectList(PageInfo pi, String userId) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		ArrayList<Board> list = new BoardDao().boardSelectList(conn, pi, userId);
		
		close(conn);
		
		return list;
	}
	
	
	// 회원 본인이 작성한 게시글 개수 조회
	public int selectListCount(String userId) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		// 총 게시글 개수 반환하기 위해
		int listCount = new BoardDao().selectListCount(conn, userId);
		
		close(conn);
		
		return listCount;
	}

	
	// 댓글 삭제하는 메소드 (상태값 N으로 업데이트)
	public int deleteReply(int rno) {
		
		Connection conn = getConnection(); // 커넥션 연결
		
		int result = new BoardDao().deleteReply(conn, rno);
		
		// 삭제할 게 있고 성공적으로 되었으면
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	


	

}
