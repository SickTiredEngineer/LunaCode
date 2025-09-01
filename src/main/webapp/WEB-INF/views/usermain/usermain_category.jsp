<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<aside class="common-category">
	<a href="UserMain" class="common-category-element active">홈</a>
	
	<!-- 강사만 보이는 메뉴 -->
	<sec:authorize access="hasRole('INSTRUCTOR')">
	<a href="CourseRegistration" class="common-category-element">강의 등록</a>
	<a href="ClassStatistic" class="common-category-element">강사 대시보드</a>
	</sec:authorize>
	
	<!-- 모든 사용자에게 보이는 메뉴 -->
	<a href="MyClass" class="common-category-element">내 강의</a>
	<a href="PlayList" class="common-category-element">재생목록</a>
	<a href="Attendance" class="common-category-element">출석</a>
	<a href="ChatBot" class="common-category-element">챗봇</a>
</aside>