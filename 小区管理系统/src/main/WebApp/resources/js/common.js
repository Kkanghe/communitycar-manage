    function previewImage(file){

        var img = document.getElementById('picImg');
					
		if (file.files && file.files[0]) 			
		{		
		   
		   //准备一个文件读取器对象，并告诉它文件读取完毕之后要做什么。
		   var reader = new FileReader();			  
		   //成功读取了图片信息后，把读取结果赋予 	
		   
		  //FileReader.readAsDataURL()
          //开始读取指定的Blob中的内容。一旦完成，result属性中将包含一个data: URL格式的字符串以表示所读取文件的内容。			   		
		   reader.onload = function(evt){
		    img.src= evt.target.result;
		    console.log("read ok! img src get value!"+evt.target.result);
		   }
		
		   console.log("start to read!")
		   reader.readAsDataURL(file.files[0]);
		
		}
	    else{
	       img.src="/stuinfo3/resources/pics/default.png";
	      // alert("no upload file!");
	    }
 		
     }  