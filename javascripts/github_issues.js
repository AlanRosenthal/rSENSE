console.log("tesT");

function runthis(test) {
  console.log(test);
};

var xmlhttp=new XMLHttpRequest();
xmlhttp.open("GET","https://api.github.com/repos/iSENSEDev/rSENSE/issues?labels=In+Testing",true);
xmlhttp.send();
xmlhttp.onreadystatechange=function() {
  if (xmlhttp.readyState==4 && xmlhttp.status==200) {
    console.log("json2");
    //JSON.parse(xmlhttp.responseText)
    runthis(xmlhttp.resonseText);
  }
};
