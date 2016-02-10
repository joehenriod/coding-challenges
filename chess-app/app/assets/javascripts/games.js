
$(function() {
  var $module       = $(".module-game"),
      $board        = $module.find(".board"),
      $rows         = $board.find(".row"),
      $files        = $board.find(".file"),
      $chessmans    = $board.find(".chessman"),
      $promotion    = $module.find(".promotion"),
      tolerance     = 5,
      startPosition = null,
      endPosition   = null;


  $chessmans.draggable({
    snap: ".file",
    snapMode: "inner",
    start: function(e) {
      var $chessman = $(this),
          $file     = $chessman.closest(".file");

      $chessman.addClass("is-dragging");
      startPosition = getPostion($file);
    },
    stop: function(e) {
      var $chessman = $(this);

      $files.each(function() {
        var $file = $(this),
            dist  = getDistance($chessman, $file);

        if (dist < tolerance) {
          var endPosition = getPostion($file);

          if (endPosition != startPosition) {
            var pieceId = $chessman.data("pieceId"),
                url     = $module.data("update-url");

            $.ajax({
              type: "PATCH",
              async: false,
              url: url,
              dataType: "json",
              data: {
                game: {
                  piece_id: pieceId,
                  destination: endPosition
                }
              },
              success: function(data, textStatus, jqXHR) {
                console.log(data);
                if (data.promotable) {
                  console.log("yo");
                  var position = $chessman.offset();

                  $promotion
                    .addClass("is-active")
                    .css({
                      left: position.left,
                      top:  position.top
                    })
                    .one("click", ".chessman", function(e) {
                      var $this = $(this),
                          type  = $this.data("pieceType"),
                          url   = $chessman.data("update-url");

                      $.ajax({
                        type: "PATCH",
                        async: false,
                        url: url,
                        dataType: "json",
                        data: {
                          piece: {
                            type: type
                          }
                        },
                        success: function(data, textStatus, jqXHR) {
                          $chessman.attr("data-piece-type", type);
                        },
                        complete: function() {
                          $promotion.removeClass("is-active");
                        }
                      });
                    });
                }

                $file.html($chessman);
              },
              error: function(data, textStatus, errorThrown) {
                console.log("ERROR in MOVE");
              }
            });
          }
              
          return false;
        }
      });

      $chessman
        .css({left: 0, top: 0})
        .removeClass("is-dragging");
    }
  });

  function getDistance($el1, $el2) {
    var diffX = Math.abs($el1.offset().left - $el2.offset().left),
        diffY = Math.abs($el1.offset().top - $el2.offset().top);

    return Math.sqrt(Math.pow(diffX, 2) + Math.pow(diffY, 2));
  }

  function getPostion($file) {
    var $rank = $file.closest('.rank'),
        xPos  = $file.index(),
        yPos  = $rank.index();

    return [xPos, yPos];
  }
});
