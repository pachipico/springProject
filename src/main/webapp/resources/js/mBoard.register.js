document.getElementById('likeBtn').addEventListener('click',()=>{
    document.getElementById('likeHate').value = 1;
    console.log(document.getElementById('likeHate').value);
});
document.getElementById('hateBtn').addEventListener('click',()=>{
    document.getElementById('likeHate').value = 0;
    console.log(document.getElementById('likeHate').value);
});

// 98f72697bdec70505dd54384d7d53a89

const apiKey = 'api_key=98f72697bdec70505dd54384d7d53a89';
const baseUrl = 'https://api.themoviedb.org/3';
const apiUrl = baseUrl + '/discover/movie?sort_by=popularity.desc&' + apiKey;
const imgUrl = 'https://image.tmdb.org/t/p/w500';
const searchUrl = baseUrl + '/search/movie?' + apiKey;

const movieArea = document.getElementById('movieArea');

// getMovies(apiUrl);

function getMovies(url){
    fetch(url).then(res => res.json()).then(result => {
        console.log(result.results);

        showMovies(result.results);
    })
}

// modal로 띄우기 가능? > 안되면 페이지 이동?
function showMovies(result){
    movieArea.innerHTML = '';

    result.forEach(movie => {
        const {adult, id, title, poster_path, release_date, vote_average} = movie;
        const movieEl = document.createElement('div');
        movieEl.classList.add('movie');
        movieEl.innerHTML = `
            <input type="hidden" id="mid" name="mid" value=${id}>
            <div>포스터: <img src="${imgUrl + poster_path}" alt="${title}"></div>
            <div>제목: ${title}</div>
            <div class="${rateColor(vote_average)}">평점: ${vote_average}</div>
            <div>개봉날짜: ${release_date}</div>
            <div>성인여부: ${adult}</div>
            <input type="radio" name="poster" value="${imgUrl + poster_path}" id="poster">선택</input>`;
            movieArea.appendChild(movieEl);
    });
}

// 평점따라 색 설정?
function rateColor(rate) {
    if(rate >= 8){
        return 'green'
    }else if(rate >= 5){
        return 'orange'
    }else{
        return 'red'
    }
}

document.getElementById('searchBtn').addEventListener('click',(e)=>{
    e.preventDefault();

    const searchTerm = document.getElementById('search').value;

    if(searchTerm){
        getMovies(searchUrl + '&query=' + searchTerm);
    }else{
        getMovies(apiUrl);
    }
});