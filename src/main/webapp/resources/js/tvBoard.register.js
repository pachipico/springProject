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
const apiUrl = baseUrl + '/discover/tv?sort_by=popularity.desc&' + apiKey;
const imgUrl = 'https://image.tmdb.org/t/p/w500';
const searchUrl = baseUrl + '/search/tv?' + apiKey;

const tvArea = document.getElementById('tvArea');

// getTvs(apiUrl);

function getTvs(url){
    fetch(url).then(res => res.json()).then(result => {
        console.log(result.results);

        showTvs(result.results);
    })
}

// modal로 띄우기 가능? > 안되면 페이지 이동?
function showTvs(result){
    tvArea.innerHTML = '';

    result.forEach(tv => {
        const {id, name, poster_path, first_air_date, vote_average} = tv;
        const tvEl = document.createElement('div');
        tvEl.classList.add('tv');
        tvEl.innerHTML = `
            <input type="hidden" id="tvid" name="tvid" value=${id}>
            <div>포스터: <img src="${imgUrl + poster_path}" alt="${name}"></div>
            <div>제목: ${name}</div>
            <div class="${rateColor(vote_average)}">평점: ${vote_average}</div>
            <div>첫방송날짜: ${first_air_date}</div>
            <input type="radio" name="poster" value="${imgUrl + poster_path}" id="poster">선택</input>`;
            tvArea.appendChild(tvEl);
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
        getTvs(searchUrl + '&query=' + searchTerm);
    }else{
        getTvs(apiUrl);
    }
});