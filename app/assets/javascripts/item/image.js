

  //グレーのブロックのレイアウト調整するメソッド。imagesLengthに表示される画像の個数を代入する。
function layoutControl(imagesLength){
  if (imagesLength < 5){
    // 画像プレビューを放り込んでいく箱の高さと幅を調整
    $('.sell-container__upload-box__image-container').css('height', '172px');
    $('.sell-container__upload-box__image-container').css('width', '620px');

    //グレーの箱の幅は、全体の幅から画像の個数だけ引いたもの。
    $('.sell-container__upload-drop-box__label').css('width', `calc(550px - ${112 * imagesLength }px`);

    // 一旦今まで表示していたイメージフィールドを見えないようにしてから。
    $('.sell-container__upload-drop-box__label').css('display','none');

    // 表示するイメージフィールドは、(画像の個数＋１)番目のイメージフィールド。
    $('.sell-container__upload-drop-box__label').eq(imagesLength).css('display','block');

  }else if(imagesLength == 5){
    // 画像プレビューを放り込んでいく箱の高さと幅を調整。５個の時は、二列になるように高さを広げる。
    $('.sell-container__upload-box__image-container').css('height','344px');
    $('.sell-container__upload-box__image-container').css('width', '620px');

    //５個の時は、グレーの箱の幅は、全体の幅と同じ。
    $('.sell-container__upload-drop-box__label').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);

    // 表示するイメージフィールドは、(画像の個数＋１)番目のイメージフィールド
    $('.sell-container__upload-drop-box__label').css('display','none');
    $('.sell-container__upload-drop-box__label').eq(imagesLength).css('display','block');

  }else{
    // 画像が６個以上で二列になる時、画像プレビューを放り込んでいく箱は５個の時と同じ。
    $('.sell-container__upload-box__image-container').css('height','344px');
    $('.sell-container__upload-box__image-container').css('width', '620px');

    // グレーの箱の幅は、全体の幅から(画像の個数-5)だけ引いたもの。
    $('.sell-container__upload-drop-box__label').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);

    // 表示するイメージフィールドは、(画像の個数＋１)番目のイメージフィールド。
    $('.sell-container__upload-drop-box__label').css('display','none');
    $('.sell-container__upload-drop-box__label').eq(imagesLength).css('display','block');
  }
}

$(function(){

// 画像のプレビューを作成するメソッド。
// imgタグに後から画像を読み込ませていく。
function buildpreview(){
  var html = `<ul class="listing-image-container">
                <li class="image-box">
                  <figure class="sell-image-figure">
                    <img class="preview-zone"></img>
                  </figure>
                  <div class="button">
                    <a class="edit">編集</a>
                    <a class="delete">削除</a>
                  </div>
                </li>
              </ul>`
  return html;
}

// 変数の定義。
  var imagesLength = null;//画像が何個あるか、を表す数字。
  var index = null;//何番目の画像を編集したり削除したりするのか、を表す数字。0が１番目に対応している。。

  // ページの読み込み時に画像が何個あるか、を読み取ってレイアウト調整。
  imagesLength = $('.image-container').children().length;
  layoutControl(imagesLength);
  // console.log('ページ読み込み時の画像の個数は');
  // console.log(imagesLength);



// ファイルがアップロードされると以下の記述が実行される。 
// 商品の画像を追加する時と編集するときの、2つで発火する。
  $(".sell-container").on("change", ".item-image-form", function(e){
    // イベントの発火時に、現状把握。
    index = ($(this).parents('label').index());//何番目のイメージフィールドが変更されたのか。
    // console.log(index);
    // console.log('番目のイメージフィールドがアップロードされました。その時の画像の個数は');
    // console.log(imagesLength);
    var html = buildpreview();
    $('.image-container').append(html);
    
    // 画像を読み込みを実行。
    var file = e.target.files[0];// これがイベントでアップロードされたファイル。最初の一個だけ使う？。
    var reader = new FileReader();
    reader.onload = function(){
      $('.preview-zone').last().attr('src', reader.result);
      // 追加されたカードは最後にあるので、そいつのimgタグに画像情報を付与。
    }
    reader.readAsDataURL(file);
    $('input[type="checkbox"]').removeAttr('checked');
    // 画像の追加が終わったあとは、imagesLengthを１増やしてレイアウト調整。
    imagesLength += 1
    layoutControl(imagesLength);
    // console.log('画像の追加が終わりました。現在の画像の個数は');
    // console.log(imagesLength);
  });
  

  // // 削除ボタンが押された時の記述。
  $(".sell-container__upload-box").on('click',".delete",function(){
    // どの画像が削除されたのか、という情報のみが必要。
    index = $(this).parents("ul").index();
    // console.log(index);
    // console.log('番目の画像が削除されようとしています。');
     if (window.location.href.match(/\/items\/\d+/)){
      // 画像の削除が完了したら、削除した画像に対応するプレビューを消去。
      $('.listing-image-container').eq(index).remove();
      $('input[type="file"]').eq(index).val("");
      $('input[type="checkbox"]').eq(index).prop('checked', true);
      // imagesLengthを１減らしてレイアウト調整。
      imagesLength -= 1;
      layoutControl(imagesLength);
      $('.sell-container__upload-drop-box__label').css('display','none');
      $('.sell-container__upload-drop-box__label').eq(index).css('display','block');
      // console.log(index);
      // console.log('番目の画像が無事削除されました。現在の画像の個数は');
      // console.log(imagesLength);
    }
    else{
      $('.listing-image-container').eq(index).remove();
      $('input[type="file"]').eq(index).val("");
      // imagesLengthを１減らしてレイアウト調整。
      imagesLength -= 1;
      layoutControl(imagesLength);
      $('.sell-container__upload-drop-box__label').css('display','none');
      $('.sell-container__upload-drop-box__label').eq(index).css('display','block');
      // console.log(index);
      // console.log('番目の画像が無事削除されました。現在の画像の個数は');
      // console.log(imagesLength);
    }
  })

});



