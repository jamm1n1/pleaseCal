package com.uni.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.uni.common.JDBCTemplate.*;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.board.model.vo.Attachment;
import com.uni.board.model.vo.Board;
import com.uni.common.model.vo.PageInfo;
import com.uni.board.model.vo.Reply;

public class BoardDao {
	
	// 프로퍼티즈 선언
	private Properties prop = new Properties();
	
	// 프로퍼티즈 파일 읽어 오기
	public BoardDao() {
		// 파일 가져와서 변수에 담기
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			// 파일 읽어 오기
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// 총 게시글 개수 카운트하는 메소드
	public int getListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql 구문 가져오기
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 조회 결과 총 개수 하나이기 때문에 if
			if(rset.next()) {
				listCount = rset.getInt(1); // 결과 listCount에 담기
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 역순으로 닫아주기
			close(rset);
			close(pstmt);
		}

		return listCount;
	}
	
	// 전체 조회하는 메소드
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		// list 선언
		ArrayList<Board> list = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql 구문 가져오기
		String sql = prop.getProperty("selectList");
		
		// 페이징 시작, 끝 페이지 로 해야 전체 조회 가능
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			// 전체 리스트 가져오기 때문에 while로
			while(rset.next()) {
				 // Board 객체 생성
				Board b = new Board(rset.getInt("BOARD_NO"),
									rset.getString("WRITER_ID"),
									rset.getString("CATEGORY"),
									rset.getInt("COUNT"),
									rset.getDate("CREATE_DATE"));

				// 비회원이 작성한 게시글일 경우 설정
				if(b.getBoardWriter() == null) {
					b.setBoardWriter("비회원");
				// 회원인 경우 아이디 일부만 노출하기 위해
				} else {
					b.setBoardWriter(b.getBoardWriter().substring(0,3) + "***");
				}
				
				list.add(b); // list에 notice 객체 담기
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 역순으로 닫아주기
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	// 공지사항 게시글 등록하는 메소드
	public int insertBoard(Connection conn, Board b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		// insert 는 ResultSet 필요 없음
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*if(b.getBoardWriter() != null) {
				pstmt.setString(1, b.getBoardWriter());
			} else {
				pstmt.setString(1, "비회원");
			}*/
			
			pstmt.setString(1, b.getBoardWriter());
			//System.out.println("boardWriter == dao == " + b.getBoardWriter());
			
			pstmt.setString(2, b.getCategory());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardPwd());
			
			//System.out.println("board === dao === " + b);
			
			result = pstmt.executeUpdate(); // result 에 담아주기
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 첨부파일 등록하는 메소드
	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 조회수 증가시키는 메소드
	public int increaseCount(Connection conn, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 게시판 상세조회
	public Board selectBoard(Connection conn, int bno) {
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		//System.out.println("bno dao : " + bno);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			// 게시글 하나만 가져오니까 if
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"),
							  rset.getString("WRITER_ID"),
							  rset.getString("CATEGORY"),
							  rset.getString("BOARD_CONTENT"),
							  rset.getString("BOARD_SECRET"),
							  rset.getString("BOARD_PWD"),
							  rset.getInt("COUNT"),
							  rset.getDate("CREATE_DATE"));
			}
			
			//System.out.println("b.getBoardWriter() : " + b.getBoardWriter());
			
			//System.out.println("b dao : " + b);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return b;
	}

	// 해당 게시글 첨부파일 가져오기
	public Attachment selectAttachment(Connection conn, int bno) {
		
		Attachment at = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				// 기본 생성자에 set 해서 하는 방법
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));

			}
			
			//System.out.println("at ====== dao ====== : " + at);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return at;
	}


	// 해당 게시판 댓글 가져오기
	public ArrayList<Reply> selectRList(Connection conn, int bno) {
		
		ArrayList<Reply> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				// list에 바로 객체 생성해서 담기
				list.add(new Reply(rset.getInt("REPLY_NO"),
								   rset.getString("REPLY_CONTENT"),
								   rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;	
		
	}


	public int insertReply(Connection conn, Reply re) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		// ResultSet 필요 없음
		
		String sql = prop.getProperty("insertReply");
		
		try {
				
			pstmt = conn.prepareStatement(sql);
			// set으로 설정
			pstmt.setInt(1, re.getRefBoardNo());
			pstmt.setString(2, re.getReplyContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 게시판 수정
	public int updateBoard(Connection conn, Board b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		// ResultSet 필요 없음
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getCategory());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 수정하는 게시판의 첨부파일 수정
	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		// ResultSet 필요 없음
		
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 게시글 수정 시 파일이 없었다면 새로 등록해주는 메소드
	public int insertNewAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		// ResultSet 필요 없음
		
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getRefBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteBoard(Connection conn, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteBoard");
		
		// 삭제니까 ResultSet 필요 없음
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// executequery 아니고 update
			// UPDATE QUESTION_BOARD SET STATUS='N' WHERE BOARD_NO=? -> 상태변화
			result = pstmt.executeUpdate(); // result에 결과 담기
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Board> boardSelectList(Connection conn, PageInfo pi, String userId) {
		
		// list 선언
		ArrayList<Board> list = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql 구문 가져오기
		String sql = prop.getProperty("boardSelectList");
		
		// 페이징 시작, 끝 페이지 로 해야 전체 조회 가능
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			// 전체 리스트 가져오기 때문에 while로
			while(rset.next()) {
				 // Board 객체 생성
				Board b = new Board(rset.getInt("BOARD_NO"),
									rset.getString("WRITER_ID"),
									rset.getString("CATEGORY"),
									rset.getInt("COUNT"),
									rset.getDate("CREATE_DATE"));
				
				list.add(b); // list에 notice 객체 담기
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 역순으로 닫아주기
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	// 회원 본인이 작성한 게시글 개수 조회
	public int selectListCount(Connection conn, String userId) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql 구문 가져오기
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			// 조회 결과 총 개수 하나이기 때문에 if
			if(rset.next()) {
				listCount = rset.getInt(1); // 결과 listCount에 담기
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 역순으로 닫아주기
			close(rset);
			close(pstmt);
		}

		return listCount;
	}


	
	// 댓글 삭제하는 메소드 (상태값 N으로 업데이트)
	public int deleteReply(Connection conn, int rno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteReply");
		
		// 삭제니까 ResultSet 필요 없음
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			// executequery 아니고 update
			// UPDATE ANSWER_REPLY SET STATUS='N' WHERE REPLY_NO=? -> 상태변화
			result = pstmt.executeUpdate(); // result에 결과 담기
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}





		
	
/*	트리거 생성으로 필요 없어짐
	public int deleteAttachment(Connection conn, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteAttachment");
		
		// 삭제니까 ResultSet 필요 없음
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// executequery 아니고 update
			// UPDATE ATTACHMENT SET STATUS='N' WHERE BOARD_NO=? -> 상태변화
			result = pstmt.executeUpdate(); // result에 결과 담기
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}


	public int deleteReply(Connection conn, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteReply");
		
		// 삭제니까 ResultSet 필요 없음
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// executequery 아니고 update
			// UPDATE ANSWER_REPLY SET STATUS='N' WHERE BOARD_NO=? -> 상태변화
			result = pstmt.executeUpdate(); // result에 결과 담기
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

*/
	


	

}
