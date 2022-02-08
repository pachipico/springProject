async function deleteHeart(heartData){
    try {
        const url = '/mHeart/' + heartData.mbId + '/' + heartData.email;
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
        const url = '/mHeart/post';
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

async function printHeartList(mbIdVal, page){
    try {
        const resp = await fetch('/mHeart/' + mbIdVal + '/' + page);
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
    }else if(e.target.id == 'heartBtn'){
        e.preventDefault();
        let heartData = {
            mbId: mbIdVal,
            email: authEmail,  
            check: heartCheck
        }
        console.log(heartData);
        const heartBtn = document.getElementById('heartBtn');
        if(heartBtn.innerHTML == '♥'){
            const newHeartBtn = '♡';
            heartBtn.innerHTML = newHeartBtn;
            deleteHeart(heartData);
        }else if(heartBtn.innerHTML == '♡'){
            const newHeartBtn = '♥';
            heartBtn.innerHTML = newHeartBtn;
            insertHeart(heartData);
        }
    }else if(e.target.id == heartList){
        // printHeartList(mbIdVal, page=1).then(result =>{
            document.getElementById('heartListArea').innerHTML = 'continue';
        // });
    }
});

