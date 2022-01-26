const API_KEY = "6e6b78d7518e1d61e33e6121c3d5e62d";
let page = 1;
let genreQuery = [];
let sortQuery = "popularity.desc";
let url = `https://api.themoviedb.org/3/discover/tv?api_key=6e6b78d7518e1d61e33e6121c3d5e62d&lair_date.gte=&air_date.lte=2022-07-24&certification=&certification_country=KR&debug=&first_air_date.gte=&first_air_date.lte=&ott_region=KR&primary_release_date.gte=&primary_release_date.lte=&region=&release_date.gte=&release_date.lte=2022-07-24&show_me=0&sort_by=popularity.desc&vote_average.gte=0&vote_average.lte=10&vote_count.gte=0&with_genres=&with_keywords=&with_networks=&with_origin_country=&with_original_language=&with_ott_monetization_types=&with_ott_providers=${platform}&with_release_type=&with_runtime.gte=0&with_runtime.lte=400&language=ko&page=`;

const searchBtn = document.getElementById("searchBtn");

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

const changeUrl = () => {
  url = `https://api.themoviedb.org/3/discover/tv?api_key=${API_KEY}&language=ko-KR&sort_by=${sortQuery}&timezone=Korea%2FSeoul&include_null_first_air_dates=false&with_watch_providers=${platform}&watch_region=KR&with_genres=${genreQuery.join(
    ","
  )}&with_watch_monetization_types=flatrate&with_status=0&with_type=0&page=`;
};

const renderTVs = async (json, page = 1) => {
  console.log(json);
  let cardContainer = document.getElementById("cardContainer");

  if (page == 1) {
    cardContainer.innerHTML = "";
  }

  json.forEach((tv) => {
    const card = `
    <div class="cards col-lg-3">
    <img id="listImg"
    src="https://www.themoviedb.org/t/p/w440_and_h660_face${tv.poster_path}"
    alt=""
    />
    
    <div class="rating">${tv.vote_average * 10}%</div>
    <a href="/tv/detail/${tv.id}" class="menu">go</a>
          <div class="cardContent">
            <div class="cardTitle">${tv.name}</div>
            <div class="cardSub">${tv.first_air_date}</div>
          </div>
        </div>`;
    cardContainer.innerHTML += card;
  });
};

document.addEventListener("DOMContentLoaded", () => {
  getJson().then((result) => renderTVs(result.results));
});

document.addEventListener("click", (e) => {
  if (e.target.id == "moreBtn") {
    ++page;
    getJson(page).then((result) => renderTVs(result.results, page));
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
    getJson().then((result) => renderTVs(result.results));
  }
});

document.addEventListener("change", (e) => {
  if (e.target.id == "orderBy") {
    sortQuery = e.target.value;
    searchBtn.style.visibility = "";
  }
});
