$(function(){
    $(".garbage_name>li").mouseover(function(){
        $(this).addClass("current");
        $(this).siblings().removeClass("current");
        var index=$(this).index();
        $li=$(".garbage_img>li").eq(index);
        ($li).addClass("show");
        // ($li).siblings().removeClass("show");
        console.log(index);
        if(index==0){
            $("#more").click(function(){
                window.location.href="search_dry.html";
             event.preventDefault()
            });
        }
        else if(index==1){
            $("#more").click(function(){
                window.location.href="search_wet.html";
            });
        }
        else if(index==2){
            $("#more").click(function(){
                window.location.href="search_harmful.html";
            });
        }
        else if(index==3){
            $("#more").click(function(){
                window.location.href="search_cycle.html";
            });
        }
    });
});