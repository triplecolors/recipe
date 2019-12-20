/**
 * 
 */


// 재료-버튼        
function addContent(obj) {
     $(obj).parent().prev().clone(true).insertAfter($(obj).parent().prev()).find('input').val("");
 }

function addSrcTitle(obj) {
	$(obj).parent().prev().clone(true).insertAfter($(obj).parent().prev());
	$(obj).parent().prev().find('input').val("");
}

$(document).on('click', '.srcContent button', function() {
	if($(this).parent().siblings('.srcContent').length == 0){
		srcTitleRemove($(this).parent());
	} else {
		$(this).parent().remove();
	}
});

function srcTitleRemove(obj) {
	if($(obj).parent().parent().siblings().length == 2){
		alert('재료가 하나 이상은 있어야 합니다!');
	} else {
		$(obj).parent().parent().remove();
	}
}

var i = 2;
// 요리순서
function addPict(obj) {
	console.log($(obj).parent());
	$(obj).parent().before('<div class="form-group row">'
								    + '<label for="inputPassword" class="col-md-2 col-form-label"><h2>Step'+ i +'</h2>'
									    + '<button type="button" class="btn btn-outline-warning" onclick="srcTitleRemove(this);">─</button>'
								    + '</label>'
								    + '<div class="col-7">'
									    + '<textarea class="form-control" placeholder="작성" rows="5" name="ctntText"></textarea>'
								    + '</div>'
								    + '<div class="col-3" align="center" onclick="clickFile('+ i +');">'
									    + '<img src="/recipe/resources/images/addImg.gif" id="fVisible'+ i +'"/>'
								    + '</div>'
							    + '</div>');
	$('#fileArea').append('<input type="file" id="flevel'+ i +'" name="fpath'+ i +'" onchange="LoadImg(this,'+ i +')">');
	i++;
	$('#i').val(i);
}



// 사진을 추가하였을 때, 이미지 태그와 연동하여 바로 보이도록
// '미리보기'기능 구현하기
function clickFile(num) {
	var str = '#flevel'+num;
		$(str).click();
}

function LoadImg(value, num) {
   if(value.files && value.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function(e){
    	  var str = '#fVisible'+num;
         $(str).attr('src', e.target.result);
	         if(num==0){
	        	 $(str).css('width','300px');
	         } else {
	        	 $(str).css('width','190px');
	         }
      }
      reader.readAsDataURL(value.files[0]);
   }
}

function WriteConfirm() {
	var result = window.confirm("작성을 취소하면, 지금 작성한 글이 모두 사라집니다.");

    if(result){
    	location.href=document.referrer;
    } else {
        
    }
}

