<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Scanner" %>

<%
	Scanner sc = new Scanner(System.in);
	Date releaseDate = new Date();

	int year = releaseDate.getYear() + 1900;
	int month = releaseDate.getMonth() + 1;
	int date = releaseDate.getDate();
	int hours = releaseDate.getHours();
    int minutes = releaseDate.getMinutes();
    int seconds = releaseDate.getSeconds();
	System.out.println(year + "/" + month+ "/" + date + " " + hours + ":" + minutes + ":" + seconds);

	releaseDate.setYear(121); // 2021년 (1900년 기준)
	releaseDate.setMonth(0);  // 1월
	releaseDate.setDate(1);   // 1일
	// System.out.println(year + "/" + month+ "/" + date + " " + hours + ":" + minutes + ":" + seconds);

%>