<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User, model.HealthRecord" %>
<%@ page import="java.time.LocalDate, java.time.YearMonth" %>
<%@ page import="java.util.List, java.util.HashSet, java.util.Set" %>
<%
	User user = (User) session.getAttribute("user");
	String name = "あなた";

	if (user != null && user.getName() != null && !user.getName().isEmpty()) {
		name = user.getName();
	}

	// 今日の日付
	LocalDate today = LocalDate.now();
	int currentYear = today.getYear();
	int currentMonth = today.getMonthValue();
	int todayDay = today.getDayOfMonth();

	// 今月情報
	YearMonth yearMonth = YearMonth.of(currentYear, currentMonth);
	int lastDay = yearMonth.lengthOfMonth();

	// 今月1日の曜日（日曜=0, 月曜=1, ... 土曜=6）
	LocalDate firstDay = yearMonth.atDay(1);
	int startDayOfWeek = firstDay.getDayOfWeek().getValue() % 7;

	// sessionから体調記録一覧を取得
	List<HealthRecord> recordList = (List<HealthRecord>) session.getAttribute("recordList");

	// 今月の「記録がある日」を入れるセット
	Set<Integer> recordDays = new HashSet<>();

	if (recordList != null) {
		for (HealthRecord record : recordList) {
			String recordDate = record.getRecordDate();

			if (recordDate != null && !recordDate.isEmpty()) {
				try {
					LocalDate recordLocalDate = LocalDate.parse(recordDate);

					if (recordLocalDate.getYear() == currentYear
							&& recordLocalDate.getMonthValue() == currentMonth) {
						recordDays.add(recordLocalDate.getDayOfMonth());
					}
				} catch (Exception e) {
					// 日付形式が不正でも画面が落ちないようにする
				}
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご自愛からだ日記🕊️ - トップ</title>
<style>
	body {
		font-family: "Yu Gothic", sans-serif;
		background-color: #f7fdf9;
		margin: 0;
		padding: 0;
	}

	.page-wrapper {
		position: relative;
		width: 600px;
		margin: 50px auto;
		padding: 20px 0;
	}

	.container {
		width: 600px;
		background-color: #ffffff;
		padding: 30px;
		border-radius: 16px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		text-align: center;
	}

	h1 {
		color: #4a7c59;
		margin-bottom: 10px;
	}

	p.subtitle {
		color: #666666;
		margin-bottom: 30px;
	}

	.greeting {
		font-size: 22px;
		font-weight: bold;
		color: #333333;
		margin-bottom: 30px;
	}

	.menu-button {
		display: block;
		width: 260px;
		margin: 15px auto;
		padding: 15px;
		background-color: #7dbb91;
		color: white;
		text-decoration: none;
		border-radius: 8px;
		font-size: 18px;
		font-weight: bold;
	}

	.menu-button:hover {
		background-color: #6aa67d;
	}

	.calendar-card {
		position: absolute;
		top: 20px;
		left: calc(100% + 70px);
		width: 320px;
		background-color: #ffffff;
		padding: 24px;
		border-radius: 16px;
		box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
	}

	.calendar-title {
		text-align: center;
		font-size: 22px;
		font-weight: bold;
		color: #4a7c59;
		margin-bottom: 20px;
	}

	.calendar-subtitle {
		text-align: center;
		font-size: 14px;
		color: #888888;
		margin-bottom: 16px;
	}

	.calendar-table {
		width: 100%;
		border-collapse: collapse;
		table-layout: fixed;
	}

	.calendar-table th {
		color: #4a7c59;
		font-size: 14px;
		padding: 8px 0;
	}

	.calendar-table td {
		height: 52px;
		text-align: center;
		vertical-align: middle;
		font-size: 15px;
		color: #333333;
	}

	.day-cell {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		height: 100%;
	}

	.calendar-day {
		display: inline-flex;
		width: 34px;
		height: 34px;
		align-items: center;
		justify-content: center;
		border-radius: 50%;
	}

	.today {
		background-color: #7dbb91;
		color: white !important;
		font-weight: bold;
		box-shadow: 0 2px 6px rgba(125, 187, 145, 0.4);
	}

	.today-record {
		background-color: #4a7c59 !important;
		color: white !important;
		font-weight: bold;
		border: 2px solid #2e5d44;
		box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
	}

	.sunday {
		color: #e57373;
	}

	.saturday {
		color: #64b5f6;
	}

	.record-dot {
		width: 6px;
		height: 6px;
		background-color: #7dbb91;
		border-radius: 50%;
		margin-top: 2px;
	}

	.calendar-link {
		text-decoration: none;
		color: inherit;
		display: flex;
		align-items: center;
		justify-content: center;
	}
</style>
</head>
<body>
	<div class="page-wrapper">

		<div class="container">
			<h1>ご自愛からだ日記🕊️</h1>
			<p class="subtitle">あなたの体調と服薬をやさしく記録</p>

			<p class="greeting"><%= name %>さん、こんにちは</p>

			<a href="healthForm.jsp" class="menu-button">今日の記録をする</a>
			<a href="healthList.jsp" class="menu-button">記録一覧を見る</a>
			<a href="medicineForm.jsp" class="menu-button">お薬を登録する</a>
		</div>

		<div class="calendar-card">
			<div class="calendar-title">🌿 <%= currentYear %>年<%= currentMonth %>月</div>
			<div class="calendar-subtitle">からだ記録カレンダー</div>

			<table class="calendar-table">
				<tr>
					<th class="sunday">日</th>
					<th>月</th>
					<th>火</th>
					<th>水</th>
					<th>木</th>
					<th>金</th>
					<th class="saturday">土</th>
				</tr>

				<%
					int day = 1;
					for (int week = 0; week < 6; week++) {
				%>
				<tr>
					<%
						for (int dow = 0; dow < 7; dow++) {
							if ((week == 0 && dow < startDayOfWeek) || day > lastDay) {
					%>
						<td></td>
					<%
							} else {
								boolean hasRecord = recordDays.contains(day);

								String dayClass = "calendar-day";
								if (dow == 0) {
									dayClass += " sunday";
								} else if (dow == 6) {
									dayClass += " saturday";
								}

								if (day == todayDay) {
									dayClass += " today";
								}

								if (day == todayDay && hasRecord) {
									dayClass += " today-record";
								}

								String dateStr = String.format("%04d-%02d-%02d", currentYear, currentMonth, day);
					%>
						<td>
							<div class="day-cell">
								<a href="healthList.jsp?date=<%= dateStr %>" class="calendar-link">
									<div class="<%= dayClass %>"><%= day %></div>
								</a>

								<% if (hasRecord) { %>
									<div class="record-dot"></div>
								<% } %>
							</div>
						</td>
					<%
								day++;
							}
						}
					%>
				</tr>
				<%
						if (day > lastDay) {
							break;
						}
					}
				%>
			</table>
		</div>

	</div>
</body>
</html>