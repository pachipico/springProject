package com.springprj.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.springprj.www.domain.LikeVO;
import com.springprj.www.domain.MovieVO;
import com.springprj.www.domain.RatingVO;
import com.springprj.www.domain.ReviewVO;

public interface MovieDAO {
	
	//movie
	List<MovieVO> selectLikedMovieList(String email);
	List<MovieVO> selectRatedMovieList(String email);
	List<MovieVO> selectReviewedMovieList(String email);
	int insertMovieData(MovieVO mvvo);
//	int updateMovieLikeCountUp(long mid);
//	int updateMovieLikeCountDown(long mid);
	
	// review 
	List<ReviewVO> seleListMovieReview(long mid);
	ReviewVO selectOneMovieReview( @Param("mid") long mid,@Param("writer") String writer); // 중복 리뷰 작성 방지용
	int insertMovieReview(ReviewVO rvvo );
	int updateMovieReview(ReviewVO rvvo);
	int deleteMovieReview( @Param("mid") long mid,@Param("writer") String writer);
	
	// like
	int selectMovieLikeCount(long mid);
	int selectOneMovieLike(@Param("mid") long mid, @Param("email") String email); //중복 좋아요 방지용 
	int insertMovieLike(LikeVO lvo);
	int deleteMovieLike(@Param("mid") long mid, @Param("email") String email);
	
	// rating
	
	double selectMovieAvgRating(long mid);
	Double selectOneMovieRating( @Param("mid") long mid,@Param("email") String email); //중복 평점 방지용(nullable)
	int insertMovieRating(RatingVO rtvo);
	int updateMovieRating(RatingVO rtvo);
	int deleteMovieRating( @Param("mid") long mid,@Param("email") String email);
}
