<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<table style="width: 100%">
		<tr>
			<th>date</th>
			<th>gu</th>
			<th>dong</th>
			<th>areaCode</th>
			<th>serviceCode</th>
			<th>totalNearStore</th>
			<th>totalStore</th>
			<th>avgNearMonth</th>
			<th>totalPeople</th>
			<th>totalNearPeople</th>
			<th>totalBizman</th>
			<th>totalNearBizman</th>
			<th>totalLivingPeople</th>
			<th>avgIncome</th>
			<th>avgOutcome</th>
			<th>totalFacility</th>
			<th>totalNearFacility</th>
			<th>sales</th>

		</tr>

		<c:forEach items="${sessionScope.area}" var="dataAll">
			<tr>
				<td>${dataAll.date}</td>
				<td>${dataAll.gu}</td>
				<td>${dataAll.dong}</td>
				<td>${dataAll.areaCode}</td>
				<td>${dataAll.serviceCode}</td>
				<td>${dataAll.totalNearStore}</td>
				<td>${dataAll.totalStore}</td>
				<td>${dataAll.avgNearMonth}</td>
				<td>${dataAll.totalPeople}</td>
				<td>${dataAll.totalNearPeople}</td>
				<td>${dataAll.totalBizman}</td>
				<td>${dataAll.totalNearBizman}</td>
				<td>${dataAll.totalLivingPeople}</td>
				<td>${dataAll.avgIncome}</td>
				<td>${dataAll.avgOutcome}</td>
				<td>${dataAll.totalFacility}</td>
				<td>${dataAll.totalNearFacility}</td>
				<td>${dataAll.sales}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>