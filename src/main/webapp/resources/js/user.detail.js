const API_KEY = "6e6b78d7518e1d61e33e6121c3d5e62d";

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
    });
  });
} else {
  moviesData.forEach((each) => {
    getDetail(each.mid, platform).then((result) => {
      console.log("movie ", result);
    });
  });
}

document.addEventListener("click", (e) => {
  if (e.target.classList.contains("likeBtn") && !e.target.classList.contains("clicked")) {
    e.target.classList.remove("btn-outline-secondary");
    e.target.classList.add("clicked");
    e.target.setAttribute("style", "color: white; border: 1px solid #dd54be; background-color:#dd54be;");
  } else if (e.target.classList.contains("likeBtn") && e.target.classList.contains("clicked")) {
    e.target.classList.add("btn-outline-secondary");
    e.target.classList.remove("clicked");
    e.target.setAttribute("style", "color: #9c9a9a;border: 1px solid #9c9a9a;");
  }
});
