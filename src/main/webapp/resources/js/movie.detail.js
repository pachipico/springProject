const API_KEY = `6e6b78d7518e1d61e33e6121c3d5e62d`;
const poster = document.getElementById("poster");
let movieTitle = document.getElementById("movieTitle");
let tagline = document.querySelector(".tLine");
let rating = document.querySelector(".headerRating");
let overview = document.querySelector(".overviewSub");
let header = document.querySelector("header");
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

document.addEventListener("DOMContentLoaded", () => {
  getMovieDetail().then((result) => renderDetail(result));
  getCredits().then((result) => renderCredits(result));
});
