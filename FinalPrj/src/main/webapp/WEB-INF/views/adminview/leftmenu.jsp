<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cp" value="${pageContext.request.contextPath}"/>

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${cp}/admin/wp-admin">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fab fa-java" ></i>
                </div>
                <div class="sidebar-brand-text mx-3">FINAL<sup>OTT조</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="${cp}/admin/wp-admin">
                    <i class="fas fa-home"></i>
                    <span>HOME</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-user" style="margin-left: 2px;" ></i>
                    <span class="collapse-item" style="margin-left: 2px;"> 회원 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${cp}/admin/adminlist">회원 조회</a>
                        <a class="collapse-item" href="${cp}/admin/adminblacklist">블랙리스트 조회</a>
                        <a class="collapse-item" href="${cp}/admin/adminpaylist">결제 관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="far fa-chart-bar" style="margin-left: 2px;"></i>
                    <span class="collapse-item" style="margin-left: 2px;">통계 조회</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${cp}/admin/adminmemberchart">회원 차트 </a>
                        <a class="collapse-item" href="${cp}/admin/adminvisiterchart">방문 기록</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>


			<!-- Nav Item - SMS -->
            <li class="nav-item">
                <a class="nav-link" href="${cp}/admin/adminsms">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>SMS 발송</span></a>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


            


        </ul>
        <!-- End of Sidebar -->
        
        
        
        