const API_KEY = `6e6b78d7518e1d61e33e6121c3d5e62d`;

const search = async (query) => {
  try {
    const config = {
      headers: { "Content-Type": "application/json" },
      method: "GET",
    };
    const res = await fetch(
      `https://api.themoviedb.org/3/search/movie?api_key=${API_KEY}&language=ko-KR&query=${query}&page=1&include_adult=false`,
      config
    );
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const renderPosters = (data) => {
  let posterDiv = document.getElementById("posterDiv");
  posterDiv.innerHTML = "";
  data
    .sort((a, b) => b.popularity - a.popularity)
    .forEach((movie) => {
      if (!movie.poster_path) return;
      const poster = `
      <div class="poster" data-title="${movie.title}">
        <div class="imgWrapper">
          <img class="img" data-src="${movie.poster_path}" src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movie.poster_path}" style="width: 300; height: 400" >
          <div class="select">이 포스터 선택</div>
        </div>	
        <h4>${movie.title}</h4>
      </div>`;
      posterDiv.innerHTML += poster;
    });
};

document.getElementById("buyBtn").addEventListener("click", () => {
  const query = document.getElementById("posterInput").value;
  search(query).then((result) => {
    console.log(result);
    renderPosters(result.results);
  });
});

document.addEventListener("click", (e) => {
  if (e.target.classList.contains("img")) {
    const title = e.target.closest(".poster").dataset.title;
    const src = e.target.dataset.src;
    console.log(title, src);
  }
});
