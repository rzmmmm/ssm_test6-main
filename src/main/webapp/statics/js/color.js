window.onload=function(){
    var head = document.querySelector('.manage_1');
    var left = document.querySelector('.left');
    var bottom = document.querySelector('.manage_2')
    var lanse=document.getElementById('theme1');
    var chengse=document.getElementById('theme2');
    var button = document.querySelectorAll('.left button');
    var right1 = document.querySelector('.right1');
    var right2 = document.querySelector('.right2');
    right1.style.display = 'block';right2.style.display = 'none';
    button[0].onclick = function(){
        right1.style.display = 'block';right2.style.display = 'none';
    }
    button[1].onclick = function(){
        right1.style.display = 'none';right2.style.display = 'block';
    }
    lanse.onclick = function(){
        changeColor('blue','dodgerblue');
}
    chengse.onclick = function(){
        changeColor('orange','brown');
}
    function changeColor(color,color2){
        head.style.backgroundColor = color2;
        bottom.style.backgroundColor = color2;
        left.style.backgroundColor = color;
        button[0].style.backgroundColor=color;
        lanse.style.backgroundColor=color;
        chengse.style.backgroundColor=color;
        button[1].style.backgroundColor=color;
        button[2].style.backgroundColor=color;
}
};
