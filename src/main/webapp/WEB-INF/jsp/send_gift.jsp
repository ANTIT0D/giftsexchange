<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<form method="post" action="/send_gift">
    Выбрать пользователя:
    <br>
    <select name="userName">
        <c:forEach var="userName" items="${listOfUserNames}">
            <option value="${userName}">${userName}</option>
        </c:forEach>
    </select>

    <br>
    Выбрать подарок:
    <br>
    <select name="userGift">
        <c:forEach var="userGift" items="${listOfUserGifts}">
            <option value="${userGift.id}">${userGift.giftName}</option>
        </c:forEach>
    </select>
    <br>
    Написать заметку к подарку:
    <input name="giftNote" type="text"></input>
    <button type="submit">send gift!</button>

</form>



