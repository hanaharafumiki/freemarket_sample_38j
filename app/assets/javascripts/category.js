$(document).on('turbolinks:load', function() {

  // selectを追加するHTML
  var cat_search = $("#select");

  function appendSelect(catNum) {
    if(catNum == 1) {
      var character_id = `m_category`
    } else if(catNum == 2) {
      var character_id = `s_category`
    }
    var html =
    `<select name="item[category_id]" class="select-default" id="${character_id}">
        <option value>選択してください</option>
    </select>`
    cat_search.append(html)
  };


  // optionを追加するHTML
  function appendCat(catOption, catNum) {
    if (catNum == 1) {
      var appendId = $("#m_category")
    } else if (catNum == 2) {
      var appendId = $("#s_category")
    }
    appendId.append(
      $("<option>")
        .val($(catOption).attr('id'))
        .text($(catOption).attr('genre'))
    )
  };

  // Lカテゴリーが選択された時のアクション
  $("#parent_form").on('change', function() {
    l_cat = $(this).val()
    $("#m_category, #s_category").remove()

    $.ajax({
      type: "GET",
      url: "/items/search",
      data: {l_cat: l_cat},
      dataType: 'json'
    })
    // doneメソッドでappendする
    .done(function(m_cat) {
      var catNum = 1
      appendSelect(catNum)
      m_cat.forEach(function(m_cat) {
        appendCat(m_cat, catNum)
      })
      })
    })

// Mカテゴリーが選択された時のアクション
  $(document).on('change', "#m_category", function() {
    m_cat = $(this).val()
    $("#s_category").remove()

    $.ajax({
      type: "GET",
      url: "/items/search",
      data: {m_cat: m_cat},
      dataType: 'json'
    })
    .done(function(s_cat) {
      var catNum = 2
      appendSelect(catNum)
      s_cat.forEach(function(s_cat) {
        appendCat(s_cat, catNum)
      });
    });
  });
});
