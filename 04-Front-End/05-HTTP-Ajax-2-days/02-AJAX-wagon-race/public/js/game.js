$(function() {

  var can_play = false;
  var session_id = null;
  var game_object = null;
  var game_finish = null;
  var start_time = null;
  var end_time = null;
  var player1 = null;
  var player2 = null;
  launch_a_session()


  $(document).keyup(function(e) {
    if (can_play == true){
      var position = 0;
      var  code = e.which
      if (code == 80) {
        var player = "player2";
        $('.racer_table #'+player+'_race td').each(function(i){
          if($(this).hasClass("active") == true) {
            position = i+1;
          }
        });
        update_player_position(player, position);
        if ((position+1) == 10) {
          victoire(player)
        }
      } else if (code == 65) {
        var player = "player1";
        $('.racer_table #'+player+'_race td').each(function(i){
          if($(this).hasClass("active") == true) {
            position = i+1;
          }
        });
        update_player_position(player, position);
        if ((position+1) == 10) {
          victoire(player)
        }
      }
    }
  });

  $(document).on("submit","form", function (e) {
    e.preventDefault();
    player1 = $("#play1").val();
    player2 = $("#play2").val();
    $('#name_player1').text(player1);
    $('#name_player2').text(player2);
    $('#backcolor').remove();
    $('#modale_type').remove();


    $('.game').show();
    reset_the_game()
  });

  $(document).on("click", ".startgame", function(event) {
    $('#backcolor').remove();
    $('#modale_type').remove();
    ask_players_names()
  });

  $(document).on("click", ".resetgame", function(event) {
    reset_the_game()
  });

  function ask_players_names() {
    $('body').append($('<div id ="backcolor"> </div>'));
    $('body').append($('<div class ="text-center" id ="modale_type"><form>Player1: <input type="text" name="player1" id="play1"><br>Player2: <input type="text" name="player2" id="play2"><input type="submit" value="Submit"></form> </div>'));

  };

  function reset_the_game() {
    $('.racer_table #player1_race td').each(function(i){
        $(this).removeClass('active');
      });
    $('.racer_table #player2_race td').each(function(i){
        $(this).removeClass('active');
      });
    update_player_position('player1', 0);
    update_player_position('player2', 0);

     var data = {
      "players": [
        { "name": player1 },
        { "name2": player2 }
      ]
    };

    $.ajax({
      type: 'POST',
      url: "/session/" + session_id + "/game/create",
      data: JSON.stringify(data),
      contentType: 'application/json',
      success: function(data) {
        game_object = data;
      }
    });

    $('#backcolor').remove();
    $('#modale_type').remove();



    var countdown = 2;
    $('body').append(('<div class="text-center" id ="timer"> '+(countdown+1)+' </div>'));
    var timer=setInterval(function(){
      $('#timer').remove();
      $('body').append(('<div class="text-center" id ="timer"> '+countdown+' </div>'));
      console.log(countdown--);
      if (countdown < 0 ) {
        $('#timer').remove();
        clearInterval(timer);
        start_time  = new Date();
        can_play = true
      }
    }, 1000);

  };



  function victoire(player) {
     end_time = new Date();
    var player_id = null;
    var winner = null;
    if (player == "player1"){
      player_id = 1
      winner = player1
    }else if (player == "player2"){
      player_id = 2
      winner = player2
    }

    var data = {
      "winner": player_id,
      "elapsed_time": end_time - start_time
    }
    $.ajax({
      type: 'POST',
      url: "/game/" + game_object.game.id + "/finish",
      data: JSON.stringify(data),
      contentType: 'application/json',
      success: function(data) {
        game_finish = data;
      }
    });
    $('body').append($('<div id ="backcolor"> </div>'));
    $('body').append($('<div class ="text-center" id ="modale_type"> <p>Victoire de '+winner+'</p> <p>Time '+((end_time - start_time)/1000)+'secondes </p> <div class = "btn btn-primary resetgame"> Play new game </div> </div>'));

    var score = parseInt($("#score_"+player).text())+1;
    $("#score_"+player).text(score)
    can_play = false
  };

  function update_player_position(player_id, position) {
    $('.racer_table #'+player_id+'_race td:nth-child('+position+')').removeClass('active');
    $('.racer_table #'+player_id+'_race td:nth-child('+(position+1)+')').addClass('active');
  };

   function launch_a_session() {
    $('.game').hide()
    $.ajax({
      type: "GET",
      url: "/session/create",
      beforeSend: function(request) {
        request.setRequestHeader("Content-Type", 'application/json');
      },
      success: function(data) {
        session_id = data.id
        $('body').append($('<div id ="backcolor"> </div>'));
        $('body').append($('<div class="text-center" id ="modale_type"> <div class = "btn btn-primary startgame"> START A NEW GAME </div> </div>'));
      },
      error: function(data) {
        console.log('Un problème est survenu');
      }
    });
    };

});