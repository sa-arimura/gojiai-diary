<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Medicine" %>
<%
	List<Medicine> medicineList = (List<Medicine>) session.getAttribute("medicineList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お薬一覧</title>
<style>
	body {
		font-family: "Yu Gothic", sans-serif;
		background-color: #f7fdf9;
		margin: 0;
		padding: 0;
	}

	.container {
		width: 900px;
		margin: 40px auto;
		background-color: #ffffff;
		padding: 30px;
		border-radius: 12px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}

	h1 {
		text-align: center;
		color: #4a7c59;
		margin-bottom: 20px;
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	th, td {
		border: 1px solid #cccccc;
		padding: 8px;
		text-align: center;
	}

	th {
		background-color: #7dbb91;
		color: white;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	.back-link {
		display: block;
		text-align: center;
		margin-top: 20px;
		color: #4a7c59;
		text-decoration: none;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>お薬一覧</h1>

		<%
			if (medicineList != null && !medicineList.isEmpty()) {
		%>

		<table>
			<tr>
				<th>持病名</th>
				<th>薬名</th>
				<th>1回量</th>
				<th>飲むタイミング</th>
				<th>1日の回数</th>
				<th>メモ</th>
			</tr>

			<%
				for (Medicine m : medicineList) {
			%>

			<tr>
				<td><%= m.getDiseaseName() %></td>
				<td><%= m.getMedicineName() %></td>
				<td><%= m.getDosage() %></td>
				<td><%= m.getTiming() %></td>
				<td><%= m.getTimesPerDay() %></td>
				<td><%= m.getMemo() %></td>
			</tr>

			<%
				}
			%>

		</table>

		<%
			} else {
		%>

		<p style="text-align:center;">まだお薬情報が登録されていません</p>

		<%
			}
		%>

		<a href="top.jsp" class="back-link">← トップへ戻る</a>
	</div>
</body>
</html>