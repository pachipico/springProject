console.log("vscode", id);
const detailUrl = `https://api.themoviedb.org/3/person/${id}?api_key=6e6b78d7518e1d61e33e6121c3d5e62d&language=ko-KR`;
const creditUrl = `https://api.themoviedb.org/3/person/${id}/combined_credits?api_key=6e6b78d7518e1d61e33e6121c3d5e62d&language=ko-KR`;

const getDetail = async () => {
  try {
    const res = await fetch(detailUrl);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

const getCredits = async () => {
  try {
    const res = await fetch(creditUrl);
    const result = await res.json();
    return await result;
  } catch (e) {
    console.log(e);
  }
};

document.addEventListener("DOMContentLoaded", () => {
  getDetail().then((result) => console.log(result));
  getCredits().then((result) => console.log(result));
});
