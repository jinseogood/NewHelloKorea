package com.kh.hello.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.board.model.vo.Reply;
import com.kh.hello.board.model.vo.Report;
import com.kh.hello.board.model.vo.Thumbs;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Override
	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		int result = sqlSession.insert("Attachment.insertReviewAttachment", a);
		
		return result;
	}

	@Override
	public int insertBoard(Board b, SqlSessionTemplate sqlSession) {
		int result = sqlSession.insert("Board.insertReviewBoard", b);
		
		return result;
	}

	@Override
	public int deleteAttachment(SqlSessionTemplate sqlSession, String changeFileName) {
		int result = sqlSession.delete("Attachment.deleteSelectReviewAttachment", changeFileName);
		
		System.out.println(changeFileName);
		
		return result;
	}

	@Override
	public int deleteAllUpload(SqlSessionTemplate sqlSession, int mId) {
		int result = sqlSession.delete("Attachment.deleteAllReviewAttachment", mId);
		
		return result;
	}

	@Override
	public ArrayList<Attachment> selectUpload(SqlSessionTemplate sqlSession, int mId) {
		ArrayList<Attachment> at = null;
		at = (ArrayList)sqlSession.selectList("Attachment.selectAttachment", mId);
		
		System.out.println(at);
		
		return at;
	}

	@Override
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		int result = 0;
		result = sqlSession.update("Board.updateReviewBoard", b);
		
		return result;
	}

	@Override
	public ArrayList<Board> selectReview(SqlSessionTemplate sqlSession, PageInfo pi, int origin_id) {
		ArrayList<Board> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Board.selectReview", origin_id, rowBounds);
		
		return list;
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate sqlSession, int origin_id) {
		
		return sqlSession.selectOne("Board.selectReviewCount", origin_id);
	}

	@Override
	public int insertQ(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("Board.insertQ", b);
	}

	@Override
	public int selectQCount(SqlSessionTemplate sqlSession, int origin_id) {

		return sqlSession.selectOne("Board.selectQCount", origin_id);
	}

	@Override
	public ArrayList<Board> selectQ(SqlSessionTemplate sqlSession, PageInfo pi, int origin_id) {
		ArrayList<Board> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Board.selectQ", origin_id, rowBounds);
		
		return list;
	}

	@Override
	public int selectA(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("Reply.insertA", r);
	}

	@Override
	public ArrayList<Reply> selectQAnswer(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Reply.selectQAnswer");
	}

	@Override
	public Board selectReviewDetail(SqlSessionTemplate sqlSession, int bid) {
		
		return sqlSession.selectOne("Board.selectReviewDetail", bid);
	}

	@Override
	public ArrayList<Attachment> selectAttachDetail(SqlSessionTemplate sqlSession, int bid) {
		
		return (ArrayList)sqlSession.selectList("Attachment.selectAttachDetail", bid);
	}

	@Override
	public ArrayList<Reply> selectRAnswer(SqlSessionTemplate sqlSession, int bid) {

		return (ArrayList)sqlSession.selectList("Reply.selectRAnswer", bid);
	}

	@Override
	public int insertReport(SqlSessionTemplate sqlSession, Report report) {
		
		return sqlSession.insert("rReport.insertReport", report);
	}

	@Override
	public Report selectReport(SqlSessionTemplate sqlSession, Report report) {
		
		return sqlSession.selectOne("rReport.selectReport", report);
	}

	@Override
	public int updateReport(SqlSessionTemplate sqlSession, Report report) {
		
		return sqlSession.update("rReport.updateReport", report);
	}

	@Override
	public int deletePrevReview(SqlSessionTemplate sqlSession, int mid) {

		return sqlSession.delete("Board.deletePrevReview", mid);
	}

	@Override
	public Thumbs selectThumbs(SqlSessionTemplate sqlSession, Thumbs thumb) {
		
		return sqlSession.selectOne("Thumbs.selectThumbs", thumb);
	}

	@Override
	public int updateThumbs(SqlSessionTemplate sqlSession, Thumbs thumb) {
		
		return sqlSession.update("Thumbs.updateThumbs", thumb);
	}

	@Override
	public int insertThumbs(SqlSessionTemplate sqlSession, Thumbs thumb) { 
		
		return sqlSession.insert("Thumbs.insertThumbs", thumb);
	}

	@Override
	public int selectThumbsCount(SqlSessionTemplate sqlSession, Thumbs thumb) {
		
		return sqlSession.selectOne("Thumbs.selectThumbsCount", thumb);
	}

	@Override
	public int updateReply(SqlSessionTemplate sqlSession, int ref_id) {
		
		return sqlSession.update("Reply.updateThumbs", ref_id);
	}

	@Override
	public int updateThumbsReview(SqlSessionTemplate sqlSession, int ref_id) {
		
		return sqlSession.update("Board.updateThumbsReview", ref_id);
	}

	@Override
	public int updateThumbsR(SqlSessionTemplate sqlSession, Thumbs thumb) {
		
		return sqlSession.update("Thumbs.updateThumbsR", thumb);
	}

	@Override
	public int selectReviewCount2(SqlSessionTemplate sqlSession, int bid) {
		
		return sqlSession.selectOne("Board.selectReviewCount2", bid);
	}

	@Override
	public int selectReplyCount(SqlSessionTemplate sqlSession, int bid) {
		
		return sqlSession.selectOne("Reply.selectReplyCount", bid);
	}

	@Override
	public int deleteReview(SqlSessionTemplate sqlSession, int bid) {

		return sqlSession.delete("Board.deleteReview", bid);
	}

	@Override
	public int updateReview(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("Board.updateReview", b);
	}

	@Override
	public int reviweBool(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.selectOne("Board.reviewBool", b);
	}

	@Override
	public int insertPoint(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("Point.insertPoint", b);
	}

	@Override
	public int selectPoint(SqlSessionTemplate sqlSession, Board b) {

		return sqlSession.selectOne("Point.selectPoint", b);
	}

	@Override
	public int selectPointA(SqlSessionTemplate sqlSession, Thumbs thumb) {

		return sqlSession.selectOne("Point.selectPointA", thumb);
	}

	@Override
	public int insertPointA(SqlSessionTemplate sqlSession, Thumbs thumb) {
	
		return sqlSession.insert("Point.insertPointA", thumb);
	}

	@Override
	public ArrayList<Board> selectBestReview(SqlSessionTemplate sqlSession, int contentid) {

		return (ArrayList)sqlSession.selectList("Board.selectBestReview", contentid);
	}

	@Override
	public ArrayList<Board> selectReview(SqlSessionTemplate sqlSession, int contentid) {
		
		return (ArrayList)sqlSession.selectList("Board.selectReview2", contentid);
	}

	@Override
	public int deleteAllUploadUpdate(SqlSessionTemplate sqlSession, int bid) {

		return sqlSession.delete("Attachment.deleteAllUploadUpdate", bid);
	}

	@Override
	public int insertAttachment2(SqlSessionTemplate sqlSession, Attachment a) {

		return sqlSession.insert("Attachment.insertAttachment2", a);
	} 

	@Override
	public Board selectGradeCheck(SqlSessionTemplate sqlSession, Board bb) {
		return sqlSession.selectOne("Board.selectGradeCheck", bb);
	}

	@Override
	public ArrayList<Board> selectFoodStoreTop3(SqlSessionTemplate sqlSession, Board bb) {
		return (ArrayList)sqlSession.selectList("Board.selectFoodStoreTop3", bb);
	}

}
