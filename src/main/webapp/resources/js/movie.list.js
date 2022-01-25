const API_KEY = "6e6b78d7518e1d61e33e6121c3d5e62d";
let page = 1;
let genreQuery = [];
let sortQuery = "";
let url = `https://api.themoviedb.org/3/movie/${sortBy}?api_key=${API_KEY}&language=ko-KR&region=KR&page=`;
const searchBtn = document.getElementById("searchBtn");

const changeUrl = () => {
  url = `https://api.themoviedb.org/3/discover/movie?api_key=${API_KEY}&language=ko-KR&region=KR&sort_by=${sortQuery}&include_adult=false&include_video=false&with_genres=${genreQuery.join(
    ","
  )}&with_watch_monetization_types=flatrate&page=`;
};
console.log(url);
const getJson = async (page = 1) => {
  try {
    const res = await fetch(url + page);
    console.log(url);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const renderMovies = async (json, page = 1) => {
  console.log(json);
  let cardContainer = document.getElementById("cardContainer");

  if (page == 1) {
    cardContainer.innerHTML = "";
  }

  json.forEach((movie) => {
    const card = `
    <div class="cards col-lg-3">
    <img
    src="https://www.themoviedb.org/t/p/w440_and_h660_face${movie.poster_path}"
    alt=""
    />
    
    <div class="rating">${movie.vote_average * 10}%</div>
    <a href="/movie/detail/${movie.id}" class="menu">go</a>
          <div class="cardContent">
            <div class="cardTitle">${movie.title}</div>
            <div class="cardSub">${movie.release_date}</div>
          </div>
        </div>`;
    cardContainer.innerHTML += card;
  });
};

document.addEventListener("DOMContentLoaded", () => {
  getJson().then((result) => renderMovies(result.results));
});

document.addEventListener("click", (e) => {
  if (e.target.id == "moreBtn") {
    page++;
    getJson(page).then((result) => renderMovies(result.results, page));
  }
  if (e.target.classList.contains("genreBtn")) {
    if (genreQuery.includes(e.target.dataset.genre)) {
      genreQuery = genreQuery.filter((query) => query != e.target.dataset.genre);
      e.target.classList.remove("btn-secondary");
      e.target.classList.add("btn-outline-secondary");
    } else {
      genreQuery.push(e.target.dataset.genre);
      e.target.classList.remove("btn-outline-secondary");
      e.target.classList.add("btn-secondary");
    }
    searchBtn.style.visibility = "";
  }
  if (e.target.id == "searchBtn") {
    changeUrl();
    getJson().then((result) => renderMovies(result.results));
  }
});

document.addEventListener("change", (e) => {
  if (e.target.id == "orderBy") {
    sortQuery = e.target.value;
    searchBtn.style.visibility = "";
  }
});
