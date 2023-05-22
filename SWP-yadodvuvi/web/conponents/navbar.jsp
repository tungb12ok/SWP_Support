<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light bg-white px-lg-3 py-lag-3 py-lg-2 shadow-sm sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand me-5 fw-blod fs-3 h-font" href="index.jsp">Yadovuvi</a>
                <button class="navbar-toggler shadow-non" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link me-2" href="hotel.jsp">KhÃ¡ch sáº¡n</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-2" href="index.jsp">Tours</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-2" href="#">VÃ© mÃ¡y bay</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-2" href="#">Cáº©m nang du lá»ch</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Others
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item me-2" href="#">Æ¯u ÄÃ£i Äáº·c biá»t</a></li>
                                <li><a class="dropdown-item me-2" href="#">Giá»i thiá»u</a></li>
                                <li><a class="dropdown-item me-2" href="#">Há» trá»£</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <!-- <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> -->
                        <!-- <button class="btn btn-outline-success" type="submit">Search</button> -->
                        <c:if test="${user != null}">
                            <div class="dropdown">
                                <button class="btn btn-outline-dark shadow-none me-lg-3 me-2 dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    ${user.getFullname()}
                                    <span class="dropdown-arrow"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="#">Profile</a></li>
                                    <li><a class="dropdown-item" href="signout">Sign out</a></li>
                                </ul>
                            </div>

                        </c:if>
                        <c:if test="${user == null}">
                            <button type="button" class="btn btn-outline-dark shadow-none me-lg-3 me-2" data-bs-toggle="modal"
                                    data-bs-target="#loginModal">
                                Login
                            </button>
                            <button type="button" class="btn btn-outline-dark shadow-none" data-bs-toggle="modal"
                                    data-bs-target="#registerModal">
                                Register
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>

        <!-- navbar.jsp -->
        <!-- Your other HTML code -->
        <!-- navbar.jsp -->
        <!-- Your other HTML code -->

        <!-- Place the modal code here -->
        <div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="signin" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title d-flex align-items-lg-center">
                                <i class="bi bi-person-circle fs-3 me-2"></i>User Login
                            </h5>
                            <button type="reset" class="btn-close shadow-none" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input type="email" class="form-control shadow-none" name="email" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control shadow-none" name="password" required>
                                <span id="passwordHelpInline" class="form-text">
                                    Must be 8-20 characters long.
                                </span>
                            </div>
                            <p class="text-danger">${mess}</p> <!-- Place the ${mess} attribute here -->
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <button type="submit" class="btn btn-dark shadow-none" id="loginButton">LOGIN</button>
                                <a href="javascript: void(0)" class="text-secondary text-decoration-none">Forgot
                                    Password</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Your other HTML code -->


        <!-- Your other HTML code -->


        <div class="modal fade" id="registerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h5 class="modal-title d-flex align-items-lg-center">
                                <i class="bi bi-person-lines-fill fs-3 me-2"></i>User Registration
                            </h5>
                            <button type="reset" class="btn-close shadow-none" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">First Name</label>
                                        <input type="text" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3 ">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Phone number</label>
                                        <input type="number" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-12 p-0 mb-3">
                                        <label class="form-label">Address</label>
                                        <textarea class="form-control shadow-none" rows="1"></textarea>
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Pincode</label>
                                        <input type="number" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Date of birth</label>
                                        <input type="date" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Password</label>
                                        <input type="password" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Confirm Password</label>
                                        <input type="password" class="form-control shadow-none">
                                    </div>

                                </div>
                            </div>
                            <div class="text-center my-1">
                                <button type="submit" class="btn btn-dark shadow-none">REGISTER</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- banner -->
        <!-- JavaScript code -->

    </body>
</html>