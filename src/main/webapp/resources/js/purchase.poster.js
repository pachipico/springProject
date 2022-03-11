const API_KEY = `6e6b78d7518e1d61e33e6121c3d5e62d`;
let imgs = document.querySelectorAll("img");

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

  if (data.length > 0) {
    data
      .sort((a, b) => b.popularity - a.popularity)
      .forEach((movie) => {
        if (!movie.poster_path) return;
        let poster;
        if (!posterList.includes(movie.title)) {
          poster = `
        <div class="poster" data-title="${movie.title}">
        <div class="imgWrapper">
        <img class="img" data-src="${movie.poster_path}" src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movie.poster_path}" style="width: 300; height: 400" >
        <div class="select" style="cursor:pointer;">이 포스터 선택</div>
        </div>	
        <h4>${movie.title}</h4>
        </div>`;
        } else {
          poster = `
        <div class="poster" data-title="${movie.title}">
        <div class="imgWrapper">
        <img  style="opacity: 0.5;" data-src="${movie.poster_path}" src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movie.poster_path}" style="width: 300; height: 400" >
        <div class="select" style="visibility: visible">이미 보유하신 포스터 입니다.</div>
        </div>	
        <h4>${movie.title}</h4>
        </div>`;
        }

        posterDiv.innerHTML += poster;
      });
  } else {
    posterDiv.innerHTML += `<h4>검색 결과가 없습니다.</h4>`;
  }
};

const buyPoster = async (title, src) => {
  try {
    const data = {
      category: 2,
      email,
      sname: title,
      price: 100,
      value: src,
    };
    const config = {
      headers: { "Content-Type": "application/json" },
      method: "POST",
      body: JSON.stringify(data),
    };
    const res = await fetch(`/purchase/register`, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log();
  }
};

document.getElementById("buyBtn").addEventListener("click", () => {
  const query = document.getElementById("posterInput").value;
  if (query) {
    search(query).then((result) => {
      console.log(result);
      renderPosters(result.results);
    });
  } else {
    alert(`검색어를 입력하세요!`);
  }
});

document.addEventListener("click", (e) => {
  if (e.target.classList.contains("img")) {
    const title = e.target.closest(".poster").dataset.title;
    const src = e.target.dataset.src;
    console.log(title, src);
    buyPoster(title, src).then((result) => {
      if (result > 0) {
        alert(`구매 완료!`);
        location.reload();
      } else if (result == 0) {
        alert(`구매 실패. 다시 시도해주세요.`);
      } else {
        alert(`포인트가 부족합니다!`);
      }
    });
  }
});
