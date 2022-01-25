const API_KEY = `6e6b78d7518e1d61e33e6121c3d5e62d`;
const poster = document.getElementById("poster");
let movieTitle = document.getElementById("movieTitle");
let tagline = document.querySelector(".tLine");
let rating = document.querySelector(".headerRating");
let overview = document.querySelector(".overviewSub");
let header = document.querySelector("header");
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
  movieTitle.innerText = json.title;
  tagline.innerText = json.tagline;
  overview.innerText = json.overview;
  rating.innerText = json.vote_average * 10 + "%";
  header.style.backgroundImage = `url('https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces${json.backdrop_path}')`;
};

const renderCredits = (json) => {
  console.log("credits: ", json);
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

const searchBtn = document.getElementById("searchBtn").addEventListener("click", (e) => {
  let query = document.getElementById("search").value;
  getList(query).then((result) => {
    console.log(result);
  });
});

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

document.addEventListener("click", (e) => {
  if (e.target.id == "reviewBtn") {
    const reviewDiv = document.getElementById("review");
    const content = reviewDiv.querySelector("[name=content]").value;
    const writer = reviewDiv.querySelector("[name=writer]").value;
    postReview(content, writer).then((result) => {
      console.log(result);
    });
  }
  if (e.target.id == "likeBtn") {
    const likeDiv = document.getElementById("like");
    const email = e.target.dataset.email;
    addLike(email).then((result) => {
      console.log(result);
    });
  }
  if (e.target.id == "ratingBtn") {
    const ratingDiv = document.getElementById("rating");
    const email = e.target.dataset.email;
    const rating = ratingDiv.querySelector("[name=rating]").value;
    postRating(email, rating).then((result) => {
      console.log(result);
    });
  }
});

document.addEventListener("DOMContentLoaded", () => {
  getMovieDetail().then((result) => {
    movieData = { mid: result.id, title: result.title, poster: result.poster_path }; // 평점, 즐겨찾기, 리뷰 남길때 같이 보내줄 데이터
    renderDetail(result);
  });
  getMovieData().then((result) => {
    userData = result;
    console.log(userData);
  });
  getCredits().then((result) => renderCredits(result));
});
