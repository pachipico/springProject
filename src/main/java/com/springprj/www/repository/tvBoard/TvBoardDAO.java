package com.springprj.www.repository.tvBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.springprj.www.domain.PagingVO;
import com.springprj.www.domain.tvBoard.TvBoardVO;

public interface TvBoardDAO {
	int insertTvBoard(TvBoardVO tvbvo);
	List<TvBoardVO> selectLikeListTvBoardPaging(PagingVO pgvo);
	List<TvBoardVO> selectHateListTvBoardPaging(PagingVO pgvo);
	int updateTvBoard(TvBoardVO tvbvo);
	int deleteTvBoard(long tvbId);
	TvBoardVO selectOneTvBoard(long tvbId);
	int selectOneTotalCount(PagingVO pgvo);
	void updateTvBoardReadCount(@Param("tvbId")long tvbId, @Param("cnt")int cnt);
	void updateTvBoardCmtQty(@Param("tvbId")long tvbId, @Param("cnt")int cnt);
	int tvBoardHeartCount(long tvbId);
}
