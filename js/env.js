String.prototype.tag=function(name){
    return "<"+name+">"+(this)+"</"+name+">";
}

function process_env(r) {
    var env="";
    for(var name in process.env){
	env+=(name+"="+process.env[name].tag("b")).tag("p")+"\r\n";
    }
    r.return(200, "process.env".tag("h1") + env);
}

export default {process_env};
