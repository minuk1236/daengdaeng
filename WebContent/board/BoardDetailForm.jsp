<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>글 상세보기</title>
	
	<style type="text/css">
		#wrap {
			width: 800px;
			margin: 0 auto 0 auto;
		}
	
		#detailBoard{
			text-align :center;
		}
		
		#title{
			height : 16;
			font-family :'돋움';
			font-size : 12;
			text-align :center;
		}
	</style>
</head>
<body>

<div id="wrap">
	<br><br>
	<div id="board">
		<table id="detailBoard" width="800" border="3" bordercolor="lightpink">
		
			<tr>
				<td id="title">작성일</td>
				<td>${board.board_date}</td>
			</tr>
			<tr>
				<td id="title">작성자</td>
				<td>${board.board_id}</td>
			</tr>
			<tr>
				<td id="title">
					제 목
				</td>
				<td>
					${board.board_subject}
				</td>		
			</tr>
			<tr>
				<td id="title">
					내 용
				</td>
				<td>
					${board.board_content}
				</td>		
			</tr>
			<tr>
				<td id="title">
					첨부파일
				</td>
				<td>
					<a href='FileDownloadAction.bo?file_name=${board.board_file}'>${board.board_file}</a>
				</td>	
			</tr>
	
			<tr align="center" valign="middle">
				<td colspan="5">
					<input type="button" value="수정" >
					<input type="button" value="삭제" >			
				</td>
			</tr>
		</table>
	</div>
</div>	

</body>
</html>