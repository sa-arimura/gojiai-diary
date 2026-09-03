<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご自愛からだ日記🕊️ - 初期登録</title>
<style>
	body {
		font-family: "Yu Gothic", sans-serif;
		background-color: #f7fdf9;
		margin: 0;
		padding: 0;
	}

	.container {
		width: 500px;
		margin: 50px auto;
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
		margin-top: 15px;
		margin-bottom: 5px;
		font-weight: bold;
		color: #333333;
	}

	input[type="text"],
	input[type="date"],
	textarea {
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
		margin-right: 15px;
		font-weight: normal;
	}

	textarea {
		height: 80px;
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
</style>
</head>
<body>
	<div class="container">
		<h1>ご自愛からだ日記🕊️</h1>
		<p class="subtitle">あなたの体調と服薬をやさしく記録</p>

		<form action="/gojiai-diary/UserRegisterServlet" method="post">
			<label for="name">名前（アプリで呼ばれたい名前）</label>
			<input type="text" id="name" name="name">

			<label for="birthDate">生年月日</label>
			<input type="date" id="birthDate" name="birthDate">

			<label>性別</label>
			<div class="radio-group">
				<label><input type="radio" name="gender" value="女性"> 女性</label>
				<label><input type="radio" name="gender" value="男性"> 男性</label>
				<label><input type="radio" name="gender" value="その他"> その他</label>
			</div>

			<label for="disease">持病</label>
			<textarea id="disease" name="disease"></textarea>

			<label for="medicine">飲んでいるお薬</label>
			<textarea id="medicine" name="medicine"></textarea>

			<div class="button-area">
				<input type="submit" value="登録する">
			</div>
		</form>
	</div>
</body>
</html>