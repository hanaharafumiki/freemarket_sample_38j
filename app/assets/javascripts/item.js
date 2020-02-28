
//新規登録時  例外処理

$(function(){

  // 入力内容チェックのための関数
function input_check(){
  let result = true;

  // エラー用装飾のためのクラスリセット
  $('#nickname').removeClass("inp_error");

  $('#item_images_attributes_0_picture').removeClass("inp_error");
  $('#item_name').removeClass("inp_error");
  $('#item_description').removeClass("inp_error");
  $('#parent_form').removeClass("inp_error");
  $('#item_id').removeClass("inp_error");
  $('#item_charge').removeClass("inp_error");
  $('#item_area').removeClass("inp_error");
  $('#item_day').removeClass("inp_error");
  $('#price_calc').removeClass("inp_error");


  // 入力エラー文をリセット
  $("#Input_error__image").empty();
  $("#Input_error__itemname").empty();
  $("#Input_error__description").empty();
  $("#Input_error__category").empty();
  $("#Input_error__status").empty();
  $("#Input_error__charge").empty();
  $("#Input_error__area").empty();
  $("#Input_error__day").empty();
  $("#Input_error__price").empty();

  // 入力内容セット

  let item_images_attributes_0_picture   =$('#item_images_attributes_0_picture').val();
  let item_name                          =$('#item_name').val();
  let item_description                   =$('#item_description').val();
  let parent_form                        =$('#parent_form').val();
  let item_id                            =$('#item_id').val();
  let item_charge                        =$('#item_charge').val();
  let item_area                          =$('#item_area').val();
  let item_day                           =$('#item_day').val();
  let price_calc                         =$('#price_calc').val();
  
  // 入力内容チェック


  //画像
  if(item_images_attributes_0_picture == ""){
   $("#Input_error__image").html("画像を入力してください");
   $("#item_images_attributes_0_picture").addClass("inp_error");
   result = false;
  }

  //商品名
  if(item_name == ""){
    $("#Input_error__itemname").html(" 商品名を入力してください");
    $("#item_name").addClass("inp_error");
    result = false;
  }


    //商品の説明
  if(item_description == ""){
   $("#Input_error__description").html("商品の説明を入力してください");
   $("#item_description").addClass("inp_error");
   result = false;
  }

  //カテゴリー
  if(parent_form == ""){
    $("#Input_error__category").html("カテゴリーを入力してください");
    $("#parent_form").addClass("inp_error");
    result = false;
   }

  //商品の状態
  if(item_id == ""){
    $("#Input_error__status").html("商品の状態を入力してください");
    $("#item_id").addClass("inp_error");
    result = false;
   }

  //発送料の負担
  if(item_charge == ""){
    $("#Input_error__charge").html("発送料の負担を入力してください");
    $("#item_charge").addClass("inp_error");
    result = false;
   }

  //発送先の地域
  if(item_area == ""){
    $("#Input_error__area").html("発送先の地域を入力してください");
    $("#item_area").addClass("inp_error");
    result = false;
   }

  //発送までの日数
  if(item_day == ""){
    $("#Input_error__day").html("発送までの日数を入力してください");
    $("#item_day").addClass("inp_error");
    result = false;
   }


  //価格
  if(price_calc == ""){
    $("#Input_error__price").html("価格を入力してください");
    $("#price_calc").addClass("inp_error");
    result = false;
   }


   return result;
}


  $("#ItemInput__btn").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(input_check()){                      //この中にsubmitアクションを作る

      $('.form').attr('action', '/items').submit();

      return false;                           //親要素のイベントを発生させない
    }
  });
});
