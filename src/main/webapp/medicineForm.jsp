<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Medicine, dao.MedicineDAO" %>
<%
	MedicineDAO dao = new MedicineDAO();
	List<Medicine> medicineList = dao.findAll();

	Medicine editMedicine = (Medicine) request.getAttribute("editMedicine");
	String errorMessage = (String) request.getAttribute("errorMessage");

	String diseaseNameValue = (editMedicine != null) ? editMedicine.getDiseaseName() : (String) request.getAttribute("diseaseName");
	String medicineNameValue = (editMedicine != null) ? editMedicine.getMedicineName() : (String) request.getAttribute("medicineName");
	String dosageValue = (editMedicine != null) ? editMedicine.getDosage() : (String) request.getAttribute("dosage");
	String medicineTypeValue = (editMedicine != null) ? editMedicine.getMedicineType() : (String) request.getAttribute("medicineType");
	String frequencyValue = (editMedicine != null) ? editMedicine.getFrequency() : (String) request.getAttribute("frequency");
	String dayOfWeekValue = (editMedicine != null) ? editMedicine.getDayOfWeek() : (String) request.getAttribute("dayOfWeek");
	String timingValue = (editMedicine != null) ? editMedicine.getTiming() : (String) request.getAttribute("timing");
	String memoValue = (editMedicine != null) ? editMedicine.getMemo() : (String) request.getAttribute("memo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご自愛からだ日記🕊️ - お薬登録</title>
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

	input[type="text"],
	textarea,
	select {
		width: 100%;
		padding: 10px;
		border: 1px solid #cccccc;
		border-radius: 8px;
		box-sizing: border-box;
		font-size: 14px;
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

	.table-area {
		margin-top: 40px;
	}

	table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 15px;
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

	input[type="submit"].delete-btn {
		background-color: #e57373;
		color: white;
		border: none;
		padding: 6px 12px;
		border-radius: 6px;
		cursor: pointer;
		font-size: 13px;
	}

	input[type="submit"].delete-btn:hover {
		background-color: #d65c5c;
	}

	input[type="submit"].edit-btn {
		background-color: #64b5f6;
		color: white;
		border: none;
		padding: 6px 12px;
		border-radius: 6px;
		cursor: pointer;
		font-size: 13px;
	}

	input[type="submit"].edit-btn:hover {
		background-color: #42a5f5;
	}

	.error-message {
		background-color: #ffe5e5;
		color: #c62828;
		border: 1px solid #ef9a9a;
		padding: 12px;
		border-radius: 8px;
		margin-bottom: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>お薬登録</h1>
		<p class="subtitle">持病とお薬の情報を登録しましょう</p>

		<% if (errorMessage != null) { %>
			<div class="error-message">
				<%= errorMessage %>
			</div>
		<% } %>

		<form action="<%= (editMedicine != null) ? "/gojiai-diary/UpdateMedicineServlet" : "/gojiai-diary/MedicineRegisterServlet" %>" method="post">

			<% if (editMedicine != null) { %>
	<input type="hidden" name="id" value="<%= editMedicine.getId() %>">
<% } %>

			<label for="diseaseName">持病名</label>
			<input type="text" id="diseaseName" name="diseaseName"
				value="<%= (diseaseNameValue != null) ? diseaseNameValue : "" %>">

			<label for="medicineName">薬名</label>
			<input type="text" id="medicineName" name="medicineName"
				value="<%= (medicineNameValue != null) ? medicineNameValue : "" %>">

			<label for="dosage">1回量</label>
			<input type="text" id="dosage" name="dosage"
				value="<%= (dosageValue != null) ? dosageValue : "" %>">

			<label for="medicineType">薬の種類</label>
			<select id="medicineType" name="medicineType">
				<option value="">選択してください</option>
				<option value="飲み薬" <%= ("飲み薬".equals(medicineTypeValue)) ? "selected" : "" %>>飲み薬</option>
				<option value="注射" <%= ("注射".equals(medicineTypeValue)) ? "selected" : "" %>>注射</option>
				<option value="塗り薬" <%= ("塗り薬".equals(medicineTypeValue)) ? "selected" : "" %>>塗り薬</option>
				<option value="貼り薬" <%= ("貼り薬".equals(medicineTypeValue)) ? "selected" : "" %>>貼り薬</option>
				<option value="吸入" <%= ("吸入".equals(medicineTypeValue)) ? "selected" : "" %>>吸入</option>
				<option value="その他" <%= ("その他".equals(medicineTypeValue)) ? "selected" : "" %>>その他</option>
			</select>

			<label for="frequency">頻度</label>
			<select id="frequency" name="frequency">
				<option value="">選択してください</option>
				<option value="毎日" <%= ("毎日".equals(frequencyValue)) ? "selected" : "" %>>毎日</option>
				<option value="毎週" <%= ("毎週".equals(frequencyValue)) ? "selected" : "" %>>毎週</option>
				<option value="必要時" <%= ("必要時".equals(frequencyValue)) ? "selected" : "" %>>必要時</option>
				<option value="頓服" <%= ("頓服".equals(frequencyValue)) ? "selected" : "" %>>頓服</option>
				<option value="その他" <%= ("その他".equals(frequencyValue)) ? "selected" : "" %>>その他</option>
			</select>

			<div id="dayOfWeekArea" style="display: none;">
				<label for="dayOfWeek">曜日（毎週のお薬の場合）</label>
				<select id="dayOfWeek" name="dayOfWeek">
					<option value="">選択してください</option>
					<option value="月曜日" <%= ("月曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>月曜日</option>
					<option value="火曜日" <%= ("火曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>火曜日</option>
					<option value="水曜日" <%= ("水曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>水曜日</option>
					<option value="木曜日" <%= ("木曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>木曜日</option>
					<option value="金曜日" <%= ("金曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>金曜日</option>
					<option value="土曜日" <%= ("土曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>土曜日</option>
					<option value="日曜日" <%= ("日曜日".equals(dayOfWeekValue)) ? "selected" : "" %>>日曜日</option>
				</select>
			</div>

			<label for="timing">使用タイミング</label>
			<select id="timing" name="timing">
				<option value="">選択してください</option>

				<optgroup label="よく使う">
					<option value="毎食後" <%= ("毎食後".equals(timingValue)) ? "selected" : "" %>>毎食後</option>
					<option value="必要時" <%= ("必要時".equals(timingValue)) ? "selected" : "" %>>必要時</option>
				</optgroup>

				<optgroup label="食事のタイミング">
					<option value="朝食前" <%= ("朝食前".equals(timingValue)) ? "selected" : "" %>>朝食前</option>
					<option value="朝食後" <%= ("朝食後".equals(timingValue)) ? "selected" : "" %>>朝食後</option>
					<option value="昼食前" <%= ("昼食前".equals(timingValue)) ? "selected" : "" %>>昼食前</option>
					<option value="昼食後" <%= ("昼食後".equals(timingValue)) ? "selected" : "" %>>昼食後</option>
					<option value="夕食前" <%= ("夕食前".equals(timingValue)) ? "selected" : "" %>>夕食前</option>
					<option value="夕食後" <%= ("夕食後".equals(timingValue)) ? "selected" : "" %>>夕食後</option>
				</optgroup>

				<optgroup label="その他">
					<option value="就寝前" <%= ("就寝前".equals(timingValue)) ? "selected" : "" %>>就寝前</option>
				</optgroup>
			</select>

			<label for="memo">メモ</label>
			<textarea id="memo" name="memo"><%= (memoValue != null) ? memoValue : "" %></textarea>

			<div class="button-area">
				<input type="submit" value="<%= (editMedicine != null) ? "更新する" : "登録する" %>">
			</div>
		</form>

		<div class="table-area">
			<h2>登録済みのお薬</h2>

			<%
				if (medicineList != null && !medicineList.isEmpty()) {
			%>
			<table>
				<tr>
					<th>持病名</th>
					<th>薬名</th>
					<th>1回量</th>
					<th>使用タイミング</th>
					<th>薬の種類</th>
					<th>頻度</th>
					<th>曜日</th>
					<th>メモ</th>
					<th>編集</th>
					<th>削除</th>
				</tr>

			<%
				for (int i = 0; i < medicineList.size(); i++) {
					Medicine m = medicineList.get(i);
			%>
				<tr>
					<td><%= m.getDiseaseName() %></td>
					<td><%= m.getMedicineName() %></td>
					<td><%= m.getDosage() %></td>
					<td><%= m.getTiming() %></td>
					<td><%= m.getMedicineType() %></td>
					<td><%= m.getFrequency() %></td>
					<td><%= m.getDayOfWeek() %></td>
					<td><%= m.getMemo() %></td>
					<td>
						<form action="/gojiai-diary/EditMedicineServlet" method="post">
							<input type="hidden" name="id" value="<%= m.getId() %>">
							<input type="submit" value="編集" class="edit-btn">
						</form>
					</td>
					<td>
						<form action="/gojiai-diary/DeleteMedicineServlet" method="post"
							onsubmit="return confirm('本当に削除しますか？');">
							<input type="hidden" name="id" value="<%= m.getId() %>">
							<input type="submit" value="削除" class="delete-btn">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				} else {
			%>
			<p>まだお薬情報が登録されていません</p>
			<%
				}
			%>
		</div>

		<a href="top.jsp" class="back-link">← トップ画面に戻る</a>
	</div>

<script>
	window.addEventListener("load", function() {
		const frequencySelect = document.getElementById("frequency");
		const dayOfWeekArea = document.getElementById("dayOfWeekArea");
		const dayOfWeekSelect = document.getElementById("dayOfWeek");

		function toggleDayOfWeek() {
			if (frequencySelect.value === "毎週") {
				dayOfWeekArea.style.display = "block";
			} else {
				dayOfWeekArea.style.display = "none";
				dayOfWeekSelect.value = "";
			}
		}

		frequencySelect.addEventListener("change", toggleDayOfWeek);
		toggleDayOfWeek();
	});
</script>

</body>
</html>