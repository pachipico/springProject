package com.springprj.www.handler;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.springprj.www.domain.movietv.MovieVO;
import com.springprj.www.domain.movietv.TVVO;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class WatchedMovieDataHandler {
	

	private int action = 0;
	private int adventure = 0;
	private int animation = 0;
	private int comedy = 0;
	private int crime = 0;
	private int documentary = 0;
	private int drama = 0;
	private int family = 0;
	private int fantasy = 0;
	private int history = 0;
	private int horror = 0;
	private int music = 0;
	private int mistery = 0;
	private int romance = 0;
	private int sf = 0;
	private int tvMovie = 0;
	private int thriller = 0;
	private int war = 0;
	private int western = 0;

	public WatchedMovieDataHandler(List<MovieVO> list) {
		for (MovieVO mvvo : list) {
			String[] strArr = mvvo.getGenres().split(",");
			for (String gen : strArr) {
				switch (gen) {
				case "28":
					action++;
					break;
				case "12":
					adventure++;
					break;
				case "16":
					animation++;
					break;
				case "35":
					comedy++;
					break;
				case "80":
					crime++;
					break;
				case "99":
					documentary++;
					break;
				case "18":
					drama++;
					break;
				case "10751":
					family++;
					break;
				case "14":
					fantasy++;
					break;
				case "36":
					history++;
					break;
				case "27":
					horror++;
					break;
				case "10402":
					music++;
					break;
				case "9648":
					mistery++;
					break;
				case "10749":
					romance++;
					break;
				case "878":
					sf++;
					break;
				case "10770":
					tvMovie++;
					break;
				case "53":
					thriller++;
					break;
				case "10752":
					war++;
					break;
				case "37":
					western++;
					break;
				default:
					break;
				}
			}

		}
	}
}
