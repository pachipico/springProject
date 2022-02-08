async function postCmtToServ(cmtData) {
    try {
        const url = '/tvComment/post';
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
            tvbId: tvbIdVal,
            writer: document.getElementById('cmtWriter').innerText,
            content: cmtText.value
        };
        postCmtToServ(cmtData).then(result =>{
            if(parseInt(result)){
                alert('댓글 등록 성공');
            }
            getCmtList(cmtData.tvbId);
        });
    }
});

async function printCmtFromServ(tvbId, page){
    try {
        const resp = await fetch('/tvComment/' + tvbId + '/' + page);
        const pageHandler = await resp.json();
        console.log(pageHandler);
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

function getCmtList(tvbId, page=1){
    printCmtFromServ(tvbId, page).then(result =>{
        console.log(result);
        const ul = document.getElementById('cmtListArea');
        if(result.cmtListTv.length){
            ul.innerHTML = "";

            for (let tvcvo of result.cmtListTv) {
                let li = `<li data-mCid="${tvcvo.tvcId}">`;
                    li += `<div><div class="profileImg"><img src="유저프로필이미지"></div>${tvcvo.content}</div>`;
                    li += `<span>${tvcvo.writer}</span><span>${tvcvo.heart}</span><span>${tvcvo.modAt}</span>`;
               // if(tvcvo.writer == ses.email){
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

async function eraseCmtAtServ(tvcId){
    try {
        const url = '/tvComment/' + tvcId;
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
        const url = '/tvComment/'+cmtDataMod.tvcId;
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
        let tvcIdVal = li.dataset.tvcId;
        eraseCmtAtServ(tvcIdVal).then(result => {
            alert('댓글 삭제 성공');
            getCmtList(tvcIdVal);
        });
    }else if(e.target.classList.contains('mod')){
        let li = e.target.closest('li');
        let cmtText = li.querySelector('.profileImg').nextSibling;
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;
        document.getElementById('cmtModBtn').setAttribute('data-mCid', li.dataset.tvcId);
    }else if(e.target.id == 'cmtModBtn'){
        let cmtDataMod = {
            tvcId: e.target.dataset.tvcId,
            content: document.getElementById('cmtTextMod').value
        };
        editCmtToServ(cmtDataMod).then(result =>{
            if(parseInt(result)){
                document.querySelector('.btn-close').click();
            }
            getCmtList(tvbIdVal);
        });
    }else if(e.target.classList.contains('page-link')){
        e.preventDefault();
        getCmtList(tvbIdVal, e.target.getAttribute('href'));
    }
});