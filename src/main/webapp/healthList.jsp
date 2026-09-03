<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.HealthRecord" %>
<%
	List<HealthRecord> recordList = (List<HealthRecord>) session.getAttribute("recordList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>体調記録一覧</title>
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
		<h1>体調記録一覧</h1>

		<%
			if (recordList != null && !recordList.isEmpty()) {
		%>

		<table>
			<tr>
				<th>日付</th>
				<th>体重</th>
				<th>体温</th>
				<th>血圧</th>
				<th>頭痛</th>
				<th>生理</th>
				<th>体調</th>
				<th>服薬状況</th>
				<th>メモ</th>
			</tr>

			<%
				for (HealthRecord r : recordList) {
			%>

			<tr>
				<td><%= r.getRecordDate() %></td>
				<td><%= r.getWeight() %> kg</td>
				<td><%= r.getTemperature() %> ℃</td>
				<td><%= r.getSystolic() %> / <%= r.getDiastolic() %></td>
				<td><%= r.getMigraine() %></td>
				<td><%= r.getPeriod() %></td>
				<td><%= r.getCondition() %></td>
				<td><%= r.getMedicineStatus() %></td>
				<td><%= r.getMemo() %></td>
			</tr>

			<%
				}
			%>

		</table>

		<%
			} else {
		%>

		<p style="text-align:center;">まだ記録がありません</p>

		<%
			}
		%>

		<a href="top.jsp" class="back-link">← トップへ戻る</a>
	</div>
</body>
</html>