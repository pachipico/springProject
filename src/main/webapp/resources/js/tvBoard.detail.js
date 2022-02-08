async function deleteHeart(heartData){
    try {
        const url = '/tvHeart/' + tvbId + '/' + authEmail;
        const config = {
            method: 'delete',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(heartData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function insertHeart(heartData){
    try {
        const url = '/tvHeart/post';
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(heartData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function printHeartList(tvbIdVal, page){
    try {
        const resp = await fetch('/tvHeart/' + tvbIdVal + '/' + page);
        const PageHandler = await resp.json();
        return await PageHandler;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener("click", (e) => {   
    if(e.target.id == 'delBtn') {
        e.preventDefault();
        document.querySelector("#delForm").submit();
    }else if(e.target.class == 'heartBtn'){
        e.preventDefault();
        let heartData = {
            tvbId: tvbIdVal,
            email: authEmail,  
            check: heartCheck
        }
        if(heartData.check == 1){
            deleteHeart(heartData).then(result =>{
                const heartBtn = document.querySelector('.heartBtn');
                heartBtn.innerText = '♡';
            });
        }else if(heartData.check == 0){
            insertHeart(heartData).then(result =>{
                const heartBtn = document.querySelector('.heartBtn');
                heartBtn.innerText = '♥';
            });
        }
    }
    // else if(e.target.id == heartList){
    //     printHeartList(tvbIdVal, page=1).then(result =>{
    //         // 이메일 > 프로필이미지, 닉네임 받아오기
    //     });
    // }
});