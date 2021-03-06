# Workin

<h3>1. 기획 배경</h3>
- 2차 프로젝트로 진행한 워크인을 스프링을 이용한 웹사이트로 구현하고자 함<br>
- 하나의 회사가 아닌 여러 회사가 사용할 수있도록 사용 범위를 늘리고자 함<br>

<h3>2. 기획 목표</h3> 
- 직원과 관리자 모드로 나뉘어 관리<br>
- 직원모드 : 자신의 일정을 확인, 일정 신청, 출퇴근<br>
- 관리자모드 : 직원들의 일정을 확인하고 요청을 수락, 거절<br>

<h3>3. DB설계</h3>

![image](https://user-images.githubusercontent.com/75840459/129468305-4621ccfa-740a-4b36-a6f7-d4932b12d117.png)

<h3>4. 사용언어와 프로그램</h3>
- eclipse<br>
- java<br>
- tomcat<br>
- spring<br>
- mysql<br>
- bootstrap<br>
- fullcalendar API<br>

<h3>5. 구현화면</h3>
- 직접구현한 기능 : 모든 직원모드
<br>
<br>
1) 메인화면<br>
- 자신의 일정 중에서 승인이 완료된 일정을 캘린더로 확인<br>
- 미승인 휴가, 근무 요청 확인<br>
- 출근, 퇴근 버튼을 이용해서 출퇴근<br>
- 휴가·근무일정 요청 버튼을 이용해서 요청 페이지로 이동<br>
<br>

![image](https://user-images.githubusercontent.com/75840459/129468883-a3ea6864-8565-4ef3-97e6-d674a8e56e8c.png)

<br>
< 카테고리 휴가로 선택한 경우 ><br>
- 승인을 대기중인 요청도 캘린더에 나타남<br>

![image](https://user-images.githubusercontent.com/75840459/129469105-0188bddc-cb0d-4735-8b68-fe733a920e2a.png)

<br>
< 카테고리 근무로 선택한 경우 ><br>

![image](https://user-images.githubusercontent.com/75840459/129469138-51aa0d9e-4cb7-44bc-b520-ffcb4bbffb66.png)

<br>
2) 요청 페이지<br>
- 요청페이지의 캘린더에서는 자신의 요청대기, 요청 거절, 요청 승인 일정을 모두 확인할 수있음<br>


![ezgif com-gif-maker (23)](https://user-images.githubusercontent.com/75840459/129469936-f791f11e-42bd-4a2c-b9ac-12cd5c370022.gif)

<br>
3) 출,퇴근 요청<br>

![출근](https://user-images.githubusercontent.com/75840459/129470286-6cc95505-25d6-418e-b6a6-0e3e304013a9.PNG)

![퇴근](https://user-images.githubusercontent.com/75840459/129470304-59b1a541-bfc8-4249-b62b-c6e505c17277.PNG)

<br>
4) 내 요청들 페이지

![ezgif com-gif-maker (24)](https://user-images.githubusercontent.com/75840459/129470519-c0b47b78-e5a7-443e-ac2c-d6aa2b2e6408.gif)


<br>
5) 출퇴근 목록

![image](https://user-images.githubusercontent.com/75840459/129470549-eb17a7d1-7e71-4b4c-81b6-252f9828dcea.png)

<br>
6) 설정, 로그아웃

![ezgif com-gif-maker (25)](https://user-images.githubusercontent.com/75840459/129471440-c516d38d-3fcd-4dc9-9b40-c1e122a1b0a8.gif)
