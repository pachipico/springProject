package com.springprj.www.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Getter
@Setter
@NoArgsConstructor
@ToString
public class TVDTO {
	private TVVO tvvo;
	// 유저의 즐겨찾기, 평점, 리뷰 정보
	private ReviewVO rvvo;
	private LikeVO lvo;
	private RatingVO rtvo;
	private int isLiked;
	private Double rating;

	// 영화의 리뷰, 즐겨찾기 수, 평균 평점
	private List<ReviewVO> rvList;
	private Integer likeCount;
	private Double avgRating;

}
