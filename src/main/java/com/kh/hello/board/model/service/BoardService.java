package com.kh.hello.board.model.service;

import java.util.ArrayList;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.board.model.vo.Reply;
import com.kh.hello.board.model.vo.Report;
import com.kh.hello.board.model.vo.Thumbs;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;

public interface BoardService{

	int insertAttachment(Attachment a);

	int insertBoard(Board b);

	int deleteAttachment(String changeFileName);

	int deleteAllUpload(int getmId);

	ArrayList<Attachment> selectUpload(int getmId);

	int updateBoard(Board b);

	ArrayList<Board> selectReview(PageInfo pi, int contentid);

	int selectReviewCount(int contentid);

	int insertQ(Board b);

	int selectQCount(int contentid);

	ArrayList<Board> selectQ(PageInfo pi, int contentid);

	int insertA(Reply r);

	ArrayList<Reply> selectQAnswer();

	Board selectReviewDetail(int bid);

	ArrayList<Attachment> selectAttachDetail(int bid);

	ArrayList<Reply> selectRAnswer(int bid);

	int insertReport(Report report);

	Report selectReport(Report report);

	int updateReport(Report report);

	int deletePrevReview(int getmId);

	Thumbs selectThumbs(Thumbs thumb);

	int updateThumbs(Thumbs thumb);

	int insertThumbs(Thumbs thumb);

	int selectThumbsCount(Thumbs thumb);

	int updateReply(int reply_id);

	int updateThumbsReview(int ref_id);

	int updateThumbsR(Thumbs thumb);

	int selectReviewCount2(int bid);

	int selectReplyCount(int bid);

	int deleteReview(int bid);

	int updateReview(Board b);

	int reviewBool(Board b);

	int insertPoint(Board b);

	int selectPoint(Board b);

	int selectPointA(Thumbs thumb);

	int insertPointA(Thumbs thumb);

	ArrayList<Board> selectBestReview(int contentid);

	ArrayList<Board> selectReview(int contentid);

	int deleteAllUploadUpdate(int bid);

	int insertAttachment2(Attachment a); 

	Board selectGradeCheck(Board bb);

	ArrayList<Board> selectFoodStoreTop3(Board bb);

} 
