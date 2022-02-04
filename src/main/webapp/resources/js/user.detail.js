const API_KEY = "6e6b78d7518e1d61e33e6121c3d5e62d";
let movieContainer = document.getElementById("movieContainer");
console.log(movieContainer);
const getDetail = async (id, platform) => {
  try {
    const url = `https://api.themoviedb.org/3/${platform}/${id}?api_key=${API_KEY}&language=ko-KR`;
    const res = await fetch(url);
    const result = res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};
if (platform == "tv") {
  tvsData.forEach((each) => {
    getDetail(each.tvid, platform).then((result) => {
      console.log("tv ", result);
      let tv = `
      <div class="movie" data-id="${result.id}">
        <div class="imageDiv">
          <img src="https://www.themoviedb.org/t/p/w150_and_h225_bestv2${result.poster_path}" />
        </div>
        <div class="contentDiv">
          <div class="titleDiv">
            <div class="rating">${result.vote_average * 10}</div>
            <div class="titleText">
              <a href="/tv/detail/${result.id}">${result.name}</a>
              <span>${result.first_air_date}</span>
            </div>
          </div>
          <div class="descDiv">
            ${result.overview}
          </div>
          <div class="btnDiv">
            <ul style="list-style-type: none; padding: 0">
              <li>
                <a class="ratingBtn btn btn-outline-secondary btn-sm">${
                  each.rating ? each.rating : '<i class="bi bi-star-fill"></i>'
                }</a>평점
              </li>
              <li>
                <a style="${
                  each.isLiked
                    ? "color: white; border: 1px solid #dd54be; background-color:#dd54be;"
                    : "color: #9c9a9a;border: 1px solid #9c9a9a;"
                }" class="btn likeBtn btn-outline-secondary btn-sm ${
        each.isLiked ? "clicked" : ""
      }"><i class="bi bi-heart-fill"></i></a>즐겨찾기
              </li>
              <li>
                <a class="btn delBtn btn-outline-secondary btn-sm"><i class="bi bi-x"></i></a>제거
              </li>
            </ul>
          </div>
        </div>
      </div>`;
      movieContainer.innerHTML = movieContainer.innerHTML + tv;
    });
  });
} else {
  moviesData.forEach((each) => {
    getDetail(each.mid, platform).then((result) => {
      console.log("movie ", result);
      let movie = `
      <div class="movie" data-id="${result.id}">
        <div class="imageDiv">
          <img src="https://www.themoviedb.org/t/p/w150_and_h225_bestv2${result.poster_path}" />
        </div>
        <div class="contentDiv">
          <div class="titleDiv">
            <div class="rating">${result.vote_average * 10}</div>
            <div class="titleText">
              <a href="/movie/detail/${result.id}">${result.title}</a>
              <span>${result.release_date}</span>
            </div>
          </div>
          <div class="descDiv">
            ${result.overview}
          </div>
          <div class="btnDiv">
            <ul style="list-style-type: none; padding: 0">
              <li>
                <a class="ratingBtn btn btn-outline-secondary btn-sm">${
                  each.rating ? each.rating : '<i class="bi bi-star-fill"></i>'
                }</a>평점
              </li>
              <li>
                <a style="${
                  each.isLiked
                    ? "color: white; border: 1px solid #dd54be; background-color:#dd54be;"
                    : "color: #9c9a9a;border: 1px solid #9c9a9a;"
                }" class="btn likeBtn btn-outline-secondary btn-sm ${
        each.isLiked ? "clicked" : ""
      }"><i class="bi bi-heart-fill"></i></a>즐겨찾기
              </li>
              <li>
                <a class="btn delBtn btn-outline-secondary btn-sm"><i class="bi bi-x"></i></a>제거
              </li>
            </ul>
          </div>
        </div>
      </div>`;
      movieContainer.innerHTML = movieContainer.innerHTML + movie;
    });
  });
}

const addLike = async (platform, id) => {
  try {
    const data = {
      mvvo: null,
      lvo: {
        mid: id,
        tvid: id,
        email,
      },
    };
    const config = {
      headers: {
        "Content-Type": "application/json",
      },
      method: "POST",
      body: JSON.stringify(data),
    };
    const url = `/${platform}/like/${id}`;
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const removeLike = async (platform, id) => {
  try {
    const data = {
      mid: id,
      tvid: id,
      email,
    };
    const config = {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    };
    const url = `/${platform}/like/${id}`;
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const remove = async (data, url) => {
  try {
    const config = {
      headers: {
        "Content-Type": "application/json",
      },
      method: "DELETE",
      body: JSON.stringify(data),
    };
    const res = await fetch(url, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

document.addEventListener("click", (e) => {
  let movie = e.target.closest(".movie");

  if (e.target.classList.contains("likeBtn") && !e.target.classList.contains("clicked")) {
    const id = movie.dataset.id;

    // 즐겨찾기 추가
    addLike(platform, id).then((result) => {
      if (parseInt(result) > 0) {
        console.log("즐겨찾기 추가 성공");
        e.target.classList.remove("btn-outline-secondary");
        e.target.classList.add("clicked");
        e.target.setAttribute("style", "color: white; border: 1px solid #dd54be; background-color:#dd54be;");
        alert("즐겨찾기 추가 성공");
      } else {
        console.log("즐겨찾기 추가 실패");
      }
    });
  } else if (e.target.classList.contains("likeBtn") && e.target.classList.contains("clicked")) {
    const id = movie.dataset.id;

    console.log(id);
    //즐겨찾기 삭제
    removeLike(platform, id).then((result) => {
      if (parseInt(result) > 0) {
        console.log("즐겨찾기 취소 성공");
        e.target.classList.add("btn-outline-secondary");
        e.target.classList.remove("clicked");
        e.target.setAttribute("style", "color: #9c9a9a;border: 1px solid #9c9a9a;");
        alert("즐겨찾기 취소 성공");
        if (list == "liked") {
          movie.remove();
        }
      } else {
        console.log("즐겨찾기 취소 실패");
      }
    });
  } else if (e.target.classList.contains("delBtn")) {
    const id = movie.dataset.id;

    console.log(id);
    console.log(list);
    console.log(platform);
    let url = "";
    let data = { mid: id, tvid: id, email };

    switch (list) {
      case "liked":
        url = `/${platform}/like/${id}`;
        break;
      case "rated":
        url = `/${platform}/rating/${id}`;
        break;
      case "reviewed":
        url = `/${platform}/review/${id}`;
        data = { mid: id, tvid: id, writer: email };
        break;
      default:
        break;
    }
    remove(data, url).then((result) => {
      // 두번째는 삭제후 평균 레이팅 값이 올때, 세번째는 삭제후 레이팅 값이 없을때 NoData가 옴.
      if (parseInt(result) > 0 || parseFloat(result) > 0 || result == "NoData") {
        console.log("제거 성공");
        alert("제거 성공");
        movie.remove();
      } else {
        console.log("제거 실패");
      }
    });
  } else if (e.target.classList.contains("ratingBtn")) {
    const id = movie.dataset.id;

    console.log(id);
  }
});
