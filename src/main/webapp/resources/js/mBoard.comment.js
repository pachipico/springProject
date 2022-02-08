async function postCmtToServ(cmtData) {
    try {
        const url = '/mComment/post';
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('cmtPostBtn').addEventListener('click',()=>{
    const cmtText = document.getElementById('cmtText');
    if(cmtText.value == null || cmtText.value == ''){
        alert('댓글 내용을 입력해주세요');
        cmtText.focus();
        return false;
    }else{
        let cmtData = {
            mbId: mbIdVal,
            writer: document.getElementById('cmtWriter').innerText,
            content: cmtText.value
        };
        postCmtToServ(cmtData).then(result =>{
            if(parseInt(result)){
                alert('댓글 등록 성공');
            }
            getCmtList(cmtData.mbId);
        });
    }
});

async function printCmtFromServ(mbId, page){
    try {
        const resp = await fetch('/mComment/' + mbId + '/' + page);
        const pageHandler = await resp.json();
        return await pageHandler;
    } catch (error) {
        console.log(error);
    }
}

function printPage(prev, startPage, pgvo, endPage, next){
    let pgn = document.getElementById('cmtPaging');
    pgn.innerHTML = '';
    let ul = `<ul>`;
    if(prev){
        ul += `<li><a href="${startPage-1}">이전</a></li>`;
    }
    for (let i = startPage; i <= endPage; i++) {
        ul += `<li class="${pgvo.pageNo == i ? 'active' : ''}">
            <a href="${i}>${i}</a></li>`;
    }
    if(next){
        ul += `<li><a href="${endPage + 1}">다음</a></li>`;
    }
    ul += `</ul>`;
    pgn.innerHTML = ul;
}

function getCmtList(mbId, page=1){
    printCmtFromServ(mbId, page).then(result =>{
        const ul = document.getElementById('cmtListArea');
        if(result.cmtListM.length){
            ul.innerHTML = "";

            for (let mcvo of result.cmtListM) {
                let li = `<li data-mCid="${mcvo.mcId}">`;
                    li += `<div><div class="profileImg"><img src="유저프로필이미지"></div>${mcvo.content}</div>`;
                    li += `<span>${mcvo.writer}</span><span>${mcvo.heart}</span><span>${mcvo.modAt}</span>`;
                // if(mcvo.writer == ses.email){
                    li += `<button type="button" class="mod">e</button><button type="button" class="del">x</button>`;
                // }
                li += `</li>`;
                ul.innerHTML += li;
            }
            printPage(result.prev, result.startPage, result.pgvo, result.endPage, result.next);
        }else{
            let li = `<li>댓글 없음</li>`;
            ul.innerHTML += li;
        }
    });
}

async function eraseCmtAtServ(mcId){
    try {
        const url = '/mComment/' + mcId;
        const config = {
            method: 'delete'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function editCmtToServ(cmtDataMod){
    try {
        const url = '/mComment/'+cmtDataMod.mcId;
        const config = {
            method: 'put',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtDataMod)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click', (e) =>{
    if(e.target.classList.contains('del')){
        let li = e.target.closest('li');
        let mcIdVal = li.dataset.mcId;
        eraseCmtAtServ(mcIdVal).then(result => {
            alert('댓글 삭제 성공');
            getCmtList(mcIdVal);
        });
    }else if(e.target.classList.contains('mod')){
        let li = e.target.closest('li');
        let cmtText = li.querySelector('.profileImg').nextSibling;
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;
        document.getElementById('cmtModBtn').setAttribute('data-mcId', li.dataset.mcId);
    }else if(e.target.id == 'cmtModBtn'){
        let cmtDataMod = {
            mCid: e.target.dataset.mCid,
            content: document.getElementById('cmtTextMod').value
        };
        editCmtToServ(cmtDataMod).then(result =>{
            if(parseInt(result)){
                document.querySelector('.btn-close').click();
            }
            getCmtList(mbIdVal);
        });
    }else if(e.target.classList.contains('page-link')){
        e.preventDefault();
        getCmtList(mbIdVal, e.target.getAttribute('href'));
    }
});