<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Medicine" %>
<%
	List<Medicine> medicineList = (List<Medicine>) session.getAttribute("medicineList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご自愛からだ日記🕊️ - 今日の記録</title>
<style>
	body {
		font-family: "Yu Gothic", sans-serif;
		background-color: #f7fdf9;
		margin: 0;
		padding: 0;
	}

	.container {
		width: 600px;
		margin: 40px auto;
		background-color: #ffffff;
		padding: 30px;
		border-radius: 12px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}

	h1 {
		text-align: center;
		color: #4a7c59;
		margin-bottom: 10px;
	}

	p.subtitle {
		text-align: center;
		color: #666666;
		margin-bottom: 30px;
	}

	label {
		display: block;
		margin-top: 18px;
		margin-bottom: 6px;
		font-weight: bold;
		color: #333333;
	}

	input[type="date"],
	input[type="number"],
	textarea,
	select {
		width: 100%;
		padding: 10px;
		border: 1px solid #cccccc;
		border-radius: 8px;
		box-sizing: border-box;
		font-size: 14px;
	}

	.radio-group {
		margin-top: 8px;
	}

	.radio-group label {
		display: inline-block;
		margin-right: 20px;
		font-weight: normal;
	}

	textarea {
		height: 100px;
		resize: vertical;
	}

	.button-area {
		text-align: center;
		margin-top: 30px;
	}

	input[type="submit"] {
		background-color: #7dbb91;
		color: white;
		border: none;
		padding: 12px 24px;
		font-size: 16px;
		border-radius: 8px;
		cursor: pointer;
		margin-right: 10px;
	}

	input[type="submit"]:hover {
		background-color: #6aa67d;
	}

	.back-link {
		display: inline-block;
		margin-top: 20px;
		color: #4a7c59;
		text-decoration: none;
		font-weight: bold;
	}

	.back-link:hover {
		text-decoration: underline;
	}
	.medicine-check {
	margin-top: 10px;
	padding: 10px;
	background-color: #f9fcfa;
	border: 1px solid #d9eadf;
	border-radius: 8px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>今日の体調記録</h1>
		<p class="subtitle">その日の体調をやさしく残しましょう</p>

		<form action="/gojiai-diary/HealthRecordServlet" method="post">
			<label for="recordDate">日付</label>
			<input type="date" id="recordDate" name="recordDate">

			<label for="weight">体重（kg）</label>
			<input type="number" id="weight" name="weight" step="0.1">

			<label for="temperature">体温（℃）</label>
			<input type="number" id="temperature" name="temperature" step="0.1">

			<label for="systolic">血圧（上）</label>
			<input type="number" id="systolic" name="systolic">

			<label for="diastolic">血圧（下）</label>
			<input type="number" id="diastolic" name="diastolic">

			<label>片頭痛症状</label>
			<div class="radio-group">
				<label><input type="radio" name="migraine" value="あり"> あり</label>
				<label><input type="radio" name="migraine" value="なし"> なし</label>
			</div>

			<label>生理</label>
			<div class="radio-group">
				<label><input type="radio" name="period" value="あり"> あり</label>
				<label><input type="radio" name="period" value="なし"> なし</label>
			</div>

			<label for="condition">気分・体調</label>
			<select id="condition" name="condition">
				<option value="">選択してください</option>
				<option value="元気">元気</option>
				<option value="少し元気">少し元気</option>
				<option value="ふつう">ふつう</option>
				<option value="少し不調">少し不調</option>
				<option value="不調">不調</option>
			</select>
<%
	if (medicineList != null && !medicineList.isEmpty()) {
%>
	<label>服薬チェック</label>

	<%
		for (Medicine m : medicineList) {
	%>
		<div class="medicine-check">
			<span><%= m.getMedicineName() %>（<%= m.getTiming() %>）</span><br>
			<div class="radio-group">
				<label><input type="radio" name="medicine_<%= m.getMedicineName() %>" value="飲んだ"> 飲んだ</label>
				<label><input type="radio" name="medicine_<%= m.getMedicineName() %>" value="飲んでいない"> 飲んでいない</label>
			</div>
		</div>
	<%
		}
	%>
<%
	}
%>
			<label for="memo">ひとことメモ</label>
			<textarea id="memo" name="memo"></textarea>

			<div class="button-area">
				<input type="submit" value="記録する">
			</div>
		</form>

		<a href="top.jsp" class="back-link">← トップ画面に戻る</a>
	</div>
</body>
</html>