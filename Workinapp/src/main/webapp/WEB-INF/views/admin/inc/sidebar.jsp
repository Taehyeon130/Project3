<%@ page contentType="text/html;charset=UTF-8"%>
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/home">
                <div class="sidebar-brand-icon rotate-n-15">
                    <!-- <i class="fas fa-laugh-wink"></i> -->
                </div>
                <div class="sidebar-brand-text mx-3">WorkIn <sup>app</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
<!--             <li class="nav-item">
                <a class="nav-link" href="/admin/home">
                    <i class="fas fa-home"></i>
                    <span>홈</span></a>
            </li> -->
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/scheduler/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-calendar-day"></i>
                    <span>근무일정</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/admin/scheduler/calender">달력형</a>
                        <a class="collapse-item" href="/admin/scheduler/list">목록형</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="attendances_calendar.html" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-plane"></i>
                    <span>휴가일정</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/admin/dayoff/calender">달력형</a>
                        <a class="collapse-item" href="/admin/dayoff/list">목록형</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/requests/req/list">
                    <i class="fas fa-paper-plane"></i>
                    <span>요청</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/employee/list">
                    <i class="fas fa-user-friends"></i>
                    <span>직원</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/admin/company/info">
                    <i class="fas fa-building"></i>
                    <span> 회사</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/admin/manager/info">
                    <i class="fas fa-cog"></i>
                    <span>계정</span></a>
            </li>
        </ul>