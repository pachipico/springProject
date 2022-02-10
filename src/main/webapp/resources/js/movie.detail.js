const API_KEY = `6e6b78d7518e1d61e33e6121c3d5e62d`;
const poster = document.getElementById("poster");
let movieTitle = document.getElementById("movieTitle");
let tagline = document.querySelector(".tLine");
let rating = document.getElementById("rt");
let overview = document.querySelector(".overviewSub");
let header = document.querySelector("header");
let currentRating = null; // 좋아요 기록 유무 임시 저장
let movieData = {};
let userData = {
  userReview: null,
  isLiked: false,
  rating: 0,
  reviewList: null,
  likeCount: 0,
  avgRating: 0,
};
const getMovieDetail = async () => {
  try {
    const url = `https://api.themoviedb.org/3/movie/${detailId}?api_key=${API_KEY}&language=ko-KR`;
    const res = await fetch(url);
    const result = res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const getCredits = async () => {
  try {
    const url = `https://api.themoviedb.org/3/movie/${detailId}/credits?api_key=${API_KEY}&language=ko-KR`;
    const res = await fetch(url);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const getWatchProviders = async () => {
  try {
    const url = `https://api.themoviedb.org/3/movie/${detailId}/watch/providers?api_key=${API_KEY}`;
    const res = await fetch(url);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const getMovieData = async () => {
  try {
    const url = `/movie/${detailId}`;
    const res = await fetch(url);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};
const renderDetail = (json) => {
  console.log("movie detail: ", json);
  poster.setAttribute("src", `https://www.themoviedb.org/t/p/w300_and_h450_face${json.poster_path}`);
  movieTitle.innerText = json.title + `(${json.release_date.slice(0, 4)})`;
  document.getElementById("dbRating").innerText = json.vote_average;
  tagline.innerText = json.tagline;
  overview.innerText = json.overview;

  header.style.backgroundImage = `url('https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces${json.backdrop_path}')`;
};

const renderCredits = (json) => {
  console.log("credits: ", json);
  let castDiv = document.getElementById("castDiv");

  json.cast.forEach((each) => {
    const card = `
    <div class="castCard">
				<div class="castImg">
				<a href="/actor/${each.id}">
				${
          each.profile_path != null
            ? `<img  src="https://themoviedb.org/t/p/w138_and_h175_face${each.profile_path}">`
            : `<div style="height: 175px;width: 138px;display:flex;justify-content:center;align-items:center;color:black;background-colol:#e6e6e6;" >no image</>`
        }
				</a>
				</div>
				<div class="castDesc">
					<div class="realNameText"><a href="">${each.name}</a></div>
					<div class="castNameText">${each.character}</div>
				</div>
			</div>
    `;
    castDiv.innerHTML = castDiv.innerHTML + card;
  });
};

const getList = async (query) => {
  try {
    const url = `https://api.themoviedb.org/3/search/movie?api_key=${API_KEY}&language=ko-KR&query=${query}&page=1&include_adult=false&region=KR`;
    const res = await fetch(url);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const postReview = async (content, writer) => {
  try {
    const data = {
      mvvo: movieData,
      rvvo: { mid: detailId, content, writer },
    };

    const config = {
      method: "post",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    };
    const url = `/movie/review/${detailId}`;
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const addLike = async (email) => {
  try {
    const data = {
      mvvo: movieData,
      lvo: { mid: detailId, email },
    };
    const config = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    };
    const url = `/movie/like/${detailId}`;
    const res = await fetch(url, config);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const removeLike = async (email) => {
  try {
    const data = {
      mid: detailId,
      email,
    };
    const config = {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    };
    const url = `/movie/like/${detailId}`;
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const postRating = async (email, rating) => {
  try {
    const data = {
      mvvo: movieData,
      rtvo: { mid: detailId, email, rating },
    };
    const config = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    };
    const url = `/movie/rating/${detailId}`;
    const res = await fetch(url, config);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const modifyRating = async (email, rating) => {
  try {
    const data = {
      mid: detailId,
      email,
      rating,
    };
    const config = {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    };
    const res = await fetch(`/movie/rating/${detailId}`, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const removeRating = async (email) => {
  try {
    const data = {
      mid: detailId,
      email,
    };
    const config = {
      headers: { "Content-Type": "application/json" },
      method: "DELETE",
      body: JSON.stringify(data),
    };
    const res = await fetch(`/movie/rating/${detailId}`, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

document.addEventListener("click", (e) => {
  if (e.target.id == "reviewBtn") {
    const reviewDiv = document.getElementById("review");
    const content = reviewDiv.querySelector("[name=content]").value;
    const writer = reviewDiv.querySelector("[name=writer]").value;
    postReview(content, writer).then((result) => {
      console.log(result);
      if (parseInt(result) > 0) {
        alert("리뷰 등록 성공");
      }
    });
  } else if (e.target.classList.contains("headerLikeBtn") && !e.target.classList.contains("clicked")) {
    const email = e.target.dataset.email;
    addLike(email).then((result) => {
      console.log(result);
      if (parseInt(result) > 0) {
        alert("즐겨찾기 추가 성공");
        e.target.classList.add("clicked");
        e.target.setAttribute("style", "color: red;");
      }
    });
  } else if (e.target.classList.contains("headerLikeBtn") && e.target.classList.contains("clicked")) {
    const email = e.target.dataset.email;
    removeLike(email).then((result) => {
      console.log(result);
      if (parseInt(result) > 0) {
        alert("즐겨찾기 삭제 성공");
        e.target.classList.remove("clicked");
        e.target.setAttribute("style", "color: #fff;");
      }
    });
  } else if (e.target.id == "deleteRatingBtn") {
    const email = document.querySelector(".headerLikeBtn").dataset.email;
    removeRating(email).then((result) => {
      console.log(result);
      if (parseFloat(result) > 0 || result == "NoData") {
        alert("평점 삭제 성공");
        rating.innerText = result;
        currentRating = null;
        document.querySelector(`.star span`).style.width = 0;
        document.querySelector(".headerRateBtn").style.color = "#fff";
        // 삭제후 별점 초기화 안됨;;
      } else {
        alert("평점 삭제 실패..");
      }
    });
  }
});

const drawStar = (target) => {
  document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
};

document.getElementById("ratingStar").addEventListener("change", (e) => {
  const email = document.querySelector(".headerLikeBtn").dataset.email;
  // 평점 등록
  if (currentRating == null) {
    postRating(email, e.target.value).then((result) => {
      if (parseFloat(result) > 0) {
        alert("평점 등록 성공");
        // 평균 평점 result로 변하게.
        document.querySelector(".headerRateBtn").style.color = "#ffc107";
        rating.innerText = result;
      } else {
        alert("평점 등록 실패..");
      }
    });
  } else {
    // 평점 수정
    modifyRating(email, e.target.value).then((result) => {
      if (parseFloat(result) > 0) {
        alert("평점 수정 성공");
        // 평균 평점 result로 변하게
        rating.innerText = result;
      } else {
        alert("평점 수정 실패..");
      }
    });
  }
  document.getElementById("modalCloseBtn").click();
  console.log(e.target.value);
});

document.addEventListener("DOMContentLoaded", () => {
  getMovieDetail().then((result) => {
    tvData = { tvid: result.id, title: result.name, poster: result.poster_path };
    movieData = { mid: result.id, title: result.title, poster: result.poster_path }; // 평점, 즐겨찾기, 리뷰 남길때 같이 보내줄 데이터
    renderDetail(result);
  });
  getMovieData().then((result) => {
    userData = result;
    console.log(userData);
    if (userData.avgRating != null) {
      rating.innerText = parseFloat(userData.avgRating).toFixed(1);
    }
    if (userData?.isLiked) {
      //좋아요 있을시 색 변하게 하기
      let headerLikeBtn = document.querySelector(".headerLikeBtn");
      headerLikeBtn.setAttribute("style", "color: red;");
      headerLikeBtn.classList.add("clicked");
    }
    if (userData?.rating != null) {
      // 좋아요 기록 있을시 해당 별점 임시저장
      document.querySelector(".headerRateBtn").setAttribute("style", "color:#ffc107;");
      document.getElementById("ratingStar").value = userData.rating;
      document.querySelector(`.star span`).style.width = `${userData.rating * 10}%`;
      currentRating = userData.rating;
    }
  });
  getCredits().then((result) => renderCredits(result));
  getWatchProviders().then((result) => {
    console.log("watch providers: ", result.results.KR);
    // movieTitle.innerHtml =
    //   movieTitle.innerHTML +
    //   `<img id="watchProvider" src="https://www.themoviedb.org/t/p/original/${result.results.KR.flatrate[0].logo_path}" />`;
    //	https://www.themoviedb.org/t/p/original/dgPueyEdOwpQ10fjuhL2WYFQwQs.jpg
  });
});
