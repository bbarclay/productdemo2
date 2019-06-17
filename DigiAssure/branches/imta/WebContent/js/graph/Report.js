/**
 * 
 */


		/*  var info = new DirectoryInfo(".\*"); 
		 var fileInfo = info.GetFiles();
		 for (file in fileInfo) print (file);
		 */
		//  alert();
		 var passRate = [];
			var fileNames = [];
		
		function initTask() {
			//alert("init");
			var path = document.location.pathname;

			var subStr = path.substring(1);
			var splitValue = subStr.split("index.html");
			var value = splitValue.join("");
			var summaryPath = value.replace("%20"," ") + "summary.json";

			var summaryJson = JSON_UTILS.readJsonFile(summaryPath);

			

			var i = 1;
			for (key in summaryJson) {
				fileNames.push(summaryJson[key].name);
				passRate.push(summaryJson[key].passRate);

			}
			var select = document.getElementById("d"), option = null;
			//var detailsTable = document.getElementById("detailsTable");
		//	detailsTable.className="table table-striped table-bordered";
			var fileLength = fileNames.length;
			for (var j = 0; j < fileLength; j++) {
				option = document.createElement("option");

				option.value = fileNames[j] + ":" + passRate[j];
				option.innerHTML = fileNames[j];
				select.appendChild(option);
				
				row=document.createElement("tr");
				sNoTd=document.createElement("td");
				var count=j+1;
				sNoTd.innerHTML=count;
				row.appendChild(sNoTd);
				
				/* reportTd=document.createElement("td");
				reportTd.innerHTML=fileNames[j];
				row.appendChild(reportTd);
				passrateTd=document.createElement("td");
				passrateTd.innerHTML=passRate[j];
				row.appendChild(passrateTd);
				detailsTable.appendChild(row); */
				
				$('#detailsTable > tbody:last').append('<tr><td>' + count +'</td><td>'+fileNames[j]+'</td><td>'+passRate[j]+'</td>');
				
				
				
			}
			
			//alert(passRate);
			//alert(fileNames);
				
			genGraph(passRate, fileNames);
		}
		function secondTask() {
			var dest = document.getElementById("d");
			passRate11 = [];
			fileNames11 = [];
			 for (var count = 0; count < dest.options.length; count++) {
				var values = dest.options[count].value;
				var index = values.indexOf(":");
				fileNames11.push(values.substr(0, index));
				passRate11.push(parseInt(values.substr(index + 1).trim()));
				
			//	
				
			

			}
			
			   var fl = fileNames11.length;
			   $('#detailsTable > tbody').empty();
				for (var j = 0; j < fl; j++) {
					var c=j+1;
					$('#detailsTable > tbody:last').append('<tr><td>' + c +'</td><td>'+fileNames11[j]+'</td><td>'+passRate11[j]+'</td>');
					
				}  
		 
			//document.getElementById("graph2").innerHTML = "";
			 var div = document.getElementById('graph2');
			while(div.firstChild){
			    div.removeChild(div.firstChild);
			} 
		
			genGraph(passRate11, fileNames11);	
		}
		function genGraph(passRat1, fileNames1) {
			$(function() {
				$('#graph2').graphify({
					start : 'linear',
					obj : {
						id : 'lol',
						legend : false,
						showPoints : true,
						width : 775,
						legendX : 450,
						pieSize : 200,
						shadow : true,
						height : 400,
						animations : true,
						x : fileNames1,
						points : passRat1,
						xDist : 90,
						scale : 12,
						yDist : 35,
						grid : false,

						design : {
							lineColor : 'red',
							tooltipFontSize : '20px',
							pointColor : 'red',
							barColor : 'blue',
							areaColor : 'orange'
						}
					}
				});

			});
		}

		function listbox_moveacross(sourceID, destID) {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);
			var picked1 = false;
			for (var count = 0; count < src.options.length; count++) {
				if (src.options[count].selected == true) {
					picked1 = true;
				}
			}
			if (picked1 == false) {
				alert("Please select an option to move.");
				return;
			}
			for (var count = 0; count < src.options.length; count++) {
				if (src.options[count].selected == true) {
					var option = src.options[count];
					var newOption = document.createElement("option");
					newOption.value = option.value;
					newOption.text = option.text;
					newOption.selected = true;
					try {
						dest.add(newOption, null);
						src.remove(count, null);
					} catch (error) {
						dest.add(newOption);
						src.remove(count);
					}
					count--;
				}
			}
		}
		function listbox_selectall(listID, isSelect) {
			var listbox = document.getElementById(listID);
			for (var count = 0; count < listbox.options.length; count++) {
				listbox.options[count].selected = isSelect;
			}
		}
	
		
		
