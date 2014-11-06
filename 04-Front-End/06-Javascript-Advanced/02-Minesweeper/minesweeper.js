var grid_size = 10;
var mine_number = parseInt(((grid_size*grid_size)*20)/100);
generateGrid();
minesRand();
completeGrid();

$("td").click(function(e){
  var y = $(this).parent().children().index(this) + 1;
  var x = $(this).parent().parent().children().index(this.parentNode) + 1;
  if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("flagged")){

  }else{
    if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("itsmine")){
      $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").removeClass("unopened").addClass("opened").addClass("mine");
      alert("perdu");
    }else {
      var id = parseInt($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").attr("id"  ));
      if (id == 0){
        $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").removeClass("unopened").addClass("opened");
        openCases(x,y);
      } else {
        $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").removeClass("unopened").addClass("opened").addClass("mine-neighbour-"+id);
      }
    }
  }
  if (victoire()) {
    alert("Victoire !!!");
  }

});


$("td").mousedown(function(e){
   if( e.button == 2 ) {
      e.preventDefault();
      var y = $(this).parent().children().index(this) + 1;
      var x = $(this).parent().parent().children().index(this.parentNode) + 1;
      if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("unopened")){
        if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("flagged")){
          $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").removeClass("flagged");
        }else {
          $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").addClass("flagged");
        }
    }
   }
 });

function victoire() {
  if ($("table tbody").find(".opened").length == ((grid_size*grid_size)-mine_number)){
    return true;
  }
}

function generateGrid() {
 for (var x = 0; x < grid_size; x++ ) {
  $("#minesweeper").append("<tr></tr>");
  for (var y = 0; y < grid_size; y++ ) {
    $("#minesweeper tr:eq("+x+")").append("<td class='unopened'></td>");
  }
  }
}

function minesRand() {
  var count = 0;

  while (count < mine_number) {
    var abs = Math.floor(Math.random()*grid_size);
    var ord = Math.floor(Math.random()*grid_size);

    if ($("table tr:eq("+abs+") td:eq("+ord+")").hasClass("itsmine")){

    }else {
      $("table tr:eq("+abs+") td:eq("+ord+")").addClass("itsmine");
      count ++;
    }
  }
};

function completeGrid() {
  for (var x = 1; x < (grid_size+1); x++ ) {
    for (var y = 1; y < (grid_size+1); y++ ) {
      if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("itsmine")){

      }else{
        var count = 0
        if (hasMine((x-1),y)){
          count ++
        }
        if (hasMine((x-1),(y-1))){
          count ++
        }
        if (hasMine((x),(y-1))){
          count ++
        }
        if (hasMine((x+1),(y-1))){
          count ++
        }
        if (hasMine((x+1),(y))){
          count ++
        }
        if (hasMine((x+1),(y+1))){
          count ++
        }
        if (hasMine((x),(y+1))){
          count ++
        }
        if (hasMine((x-1),(y+1))){
          count ++
        }
        $("table tr:nth-child("+x+") td:nth-child("+y+")").addClass("its"+count).attr("id",count)
      }
    }
  }
}

function hasMine(x,y) {
  if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("itsmine")){
    return true
  }
}

function openCases(x,y) {

  openCase((x-1),y);
  openCase((x-1),(y-1));
  openCase((x),(y-1));
  openCase((x+1),(y-1));
  openCase((x+1),(y));
  openCase((x+1),(y+1));
  openCase((x),(y+1));
  openCase((x-1),(y+1));

  }


function openCase(x,y){
  var id = parseInt($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").attr("id"));
  if ($("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").hasClass("unopened")){
    if (id == 0){
      $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").removeClass("flagged").removeClass("unopened").addClass("opened");
      openCases(x,y);
    } else {
      $("table tr:nth-child("+(x)+") td:nth-child("+(y)+")").removeClass("flagged").removeClass("unopened").addClass("opened").addClass("mine-neighbour-"+id);
    }
  }
}


