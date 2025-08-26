<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="d-flex flex-column align-items-center common-category category-size">
	<a href="NoticeList" class="common-category-element">공지사항</a>
	<a href="FAQList" class="common-category-element">FAQ</a>
	
	<c:if test="${isAuthenticated}">
		<a href="PersonalSupport" class="common-category-element">1:1 문의</a>
	</c:if>
</div>