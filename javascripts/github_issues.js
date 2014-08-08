console.log("tesT");

var xmlhttp=new XMLHttpRequest();
var json = "";
xmlhttp.open("GET","https://api.github.com/repos/iSENSEDev/rSENSE/issues?labels=In+Testing",true);
xmlhttp.send();
xmlhttp.onreadystatechange=function()
{
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
//        console.log(xmlhttp.responseText);
        console.log("test1");
        json = xmlhttp.resonseText;
        console.log(json);
        runthis();
    }
}

function runthis() {
    console.log(json);
}
