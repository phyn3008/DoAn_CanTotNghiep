<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.TrangChu" %>

<!DOCTYPE html>

<html lang="en">  
<head>
    <title>WEB QUẢN LÝ NHÀ HÀNG</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../CSS/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">

        <!-- FONT GOOGLE -->

    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    
    <link rel="stylesheet" href="../CSS/owl.carousel.min.css">
    <link rel="stylesheet" href="../CSS/owl.theme.default.min.css">
    <link rel="stylesheet" href="../CSS/index.css">

</head>
<body>
    <div>
        <div class="header__top d-flex justify-content-between align-items-center container-fluid py-2">
            <div class="header__left">
                <a href="tel:0961051014" class="text-white mr-4"><i class="fas fa-phone-alt"></i>  0932711034</a>
                <a href="mailto:info@restaurantAnhDuong.edu.vn" class="text-white"><i class="far fa-envelope"></i>
                    restaurantAnhDuong@gmail.com</a>
                
            </div>
            <div class="header__right">
                <a href="DangNhap.aspx"><i class="fa fa-user"></i></a>
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-pinterest-p"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <nav class="navInstruction navbar navbar-expand-lg container">
            <a class="navbar-brand text-center" href="TrangChu.aspx">
                <p class="font-weight-bold mb-0"><i class="fa fa-book"></i> ÁNH DƯƠNG</p>
                <p class="mb-0">Delicious and Nutritious</p>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarInstruction"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarInstruction">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="TrangChu.aspx">TRANG CHỦ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="XemMonAn.aspx">MENU</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="TrangChu.aspx" id="navbarDropdownMenuLink" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ORDER
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="DatBan.aspx">Đặt Bàn</a>
                            <a class="dropdown-item" href="DatMonMangVe.aspx">Đặt Món Mang Về</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">ĐĂNG KÝ THÀNH VIÊN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">LIÊN HỆ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GioHang.aspx"><i class="fa fa-shopping-bag"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <section class="cyberCarousel">
        <div id="carouselCyber" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#carouselCyber" data-slide-to="0" class="active"></li>
                <li data-target="#carouselCyber" data-slide-to="1"></li>
                <li data-target="#carouselCyber" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../Images/banner_4.jpg" class="d-block w-100" alt="banner1">
                </div>
                <div class="carousel-item">
                    <img src="../Images/banner_2.jpg" class="d-block w-100" alt="banner2" />                  
                </div>
                <div class="carousel-item">
                    <img src="../Images/banner_3.jpg" class="d-block w-100" alt="banner3"> 
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselCyber" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselCyber" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>
    <section class="welcome section">
        <div class="heading">
            <h2>GIỚI THIỆU VỀ NHÀ HÀNG</h2>
            <p>when climbing the carrer ladder</p>
        </div>
        <div class="welcome__content">
            <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, sunt in culpa
                qui officia deserunt mollit anim id est laboth. Duis aute irure dolor in reprehenderit in voluptate
                velit esse cillum dolore eu fugiat nulla pariatur sunt in culpa qui .</p>
            <div class="welcome__courses container">
                <div class="row">
                    <div class="welcome__col col-4 border border-dark">
                        <div class="welcome__item">
                            <i class="fa fa-book-open"></i>
                            <h3>ĐA DẠNG</h3>
                            <h4>Món Ăn Phương Tây</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                            <h4>Món Ăn Việt Nam</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                            <h4>Món Ăn Trung Đông</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                        </div>
                    </div>
                    <div class="welcome__col col-4 border border-dark">
                        <div class="welcome__item">
                            <i class="fa fa-thumbs-up"></i>
                            <h3>CHẤT LƯỢNG</h3>
                            <h4>Sạch Sẽ</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                            <h4>Giàu Dinh Dưỡng</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                            <h4>Bảo Đảm</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                        </div>
                    </div>
                    <div class="welcome__col col-4 border border-dark">
                        <div class="welcome__item">
                            <i class="fa fa-hand-holding-usd"></i>
                            <h3>THANH TOÁN</h3>
                            <h4>Nhanh Chóng</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                            <h4>Thuận Tiện</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                            <h4>Hài Lòng Khách Hàng</h4>
                            <p>Ncididunt ut labore et t enim ad minim.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ourStats section">
        <div class="heading heading--white">
            <h2>HOẠT ĐỘNG</h2>
            <p>when climbing the carrer ladder</p>
        </div>
        <div class="ourStats__content container">
            <div class="row">
                <div class="col-3">
                    <div class="ourStats__item">
                        <i class="fa fa-place-of-worship"></i>
                        <h3>Kinh Nghiệm</h3>
                        <p>10</p>
                    </div>
                </div>
                <div class="col-3">
                    <div class="ourStats__item">
                        <i class="fa fa-user"></i>
                        <h3>Đầu Bếp</h3>
                        <p>20</p>
                    </div>
                </div>
                <div class="col-3">
                    <div class="ourStats__item">
                        <i class="fa fa-users"></i>
                        <h3>Nhân Viên</h3>
                        <p>+100</p>
                    </div>
                </div>
                <div class="col-3">
                    <div class="ourStats__item">
                        <i class="fa fa-trophy"></i>
                        <h3>Giải Thưởng</h3>
                        <p>5</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="offer section">
        <div class="heading">
            <h2>DỊCH VỤ</h2>
            <p>when climbing the carrer ladder</p>
        </div>
        <div class="offer__content container">
            <div class="row">
                <div class="col-4 offer__col">
                    <div class="offer__item">
                        <i class="fa fa-th-large"></i>
                        <h3>ĐẶT BÀN TRƯỚC</h3>
                        <p>Lorem ipsum dolor sit amet, Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                        </p>
                    </div>
                </div>
                <div class="col-4 offer__col">
                    <div class="offer__item">
                        <i class="fa fa-gift"></i>
                        <h3>ƯU ĐÃI</h3>
                        <p>Lorem ipsum dolor sit amet, Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                        </p>
                    </div>
                </div>
                <div class="col-4 offer__col">
                    <div class="offer__item">
                        <i class="fa fa-handshake"></i>
                        <h3>CHẤT LƯỢNG PHỤC VỤ</h3>
                        <p>Lorem ipsum dolor sit amet, Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                        </p>
                    </div>
                </div>
                <div class="col-4 offer__col">
                    <div class="offer__item">
                        <i class="fa fa-shipping-fast"></i>
                        <h3>ĐẶT MÓN MANG VỀ</h3>
                        <p>Lorem ipsum dolor sit amet, Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                        </p>
                    </div>
                </div>
                <div class="col-4 offer__col">
                    <div class="offer__item">
                        <i class="fa fa-user-shield"></i>
                        <h3>HÀI LÒNG</h3>
                        <p>Lorem ipsum dolor sit amet, Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                        </p>
                    </div>
                </div>
                <div class="col-4 offer__col">
                    <div class="offer__item">
                        <i class="fa fa-piggy-bank"></i>
                        <h3>TIẾT KIỆM</h3>
                        <p>Lorem ipsum dolor sit amet, Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="feedback">
        <div class="heading">
            <h2>TESTIMONIALS</h2>
            <p class="text-white">When Climbing The Carrer Ladder</p>
        </div>
        <div class="feedback__content container">
            <div class="owl-carousel owl-theme">
                <div class="item">
                    <div class="feedback__top">
                        <p> Sed semper leo metus, a lacinia eros semper at. Etiam sodales orci sit amet vehicula
                            pellentesque. </p>            
                    </div>
                    <div class="feedback__bottom">
                        <img src="../Images/test1.jpg" alt="">
                        <div class="feedback__name">
                            <p>Mary Jane</p>
                            <p>Lorem, ipsum.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="feedback__top">
                        <p> Sed semper leo metus, a lacinia eros semper at. Etiam sodales orci sit amet vehicula
                            pellentesque. </p>            
                    </div>
                    <div class="feedback__bottom">
                        <img src="../Images/test2.jpg" alt="">
                        <div class="feedback__name">
                            <p>Peter Paker</p>
                            <p>Lorem, ipsum.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="feedback__top">
                        <p> Sed semper leo metus, a lacinia eros semper at. Etiam sodales orci sit amet vehicula
                            pellentesque. </p>            
                    </div>
                    <div class="feedback__bottom">
                        <img src="../Images/test3.jpg" alt="">
                        <div class="feedback__name">
                            <p>Tony Stark</p>
                            <p>Lorem, ipsum.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="feedback__top">
                        <p> Sed semper leo metus, a lacinia eros semper at. Etiam sodales orci sit amet vehicula
                            pellentesque. </p>            
                    </div>
                    <div class="feedback__bottom">
                        <img src="../Images/test1.jpg" alt="">
                        <div class="feedback__name">
                            <p>Hulk</p>
                            <p>Lorem, ipsum.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="feedback__top">
                        <p> Sed semper leo metus, a lacinia eros semper at. Etiam sodales orci sit amet vehicula
                            pellentesque. </p>            
                    </div>
                    <div class="feedback__bottom">
                        <img src="../Images/test2.jpg" alt="">
                        <div class="feedback__name">
                            <p>Mary Jane</p>
                            <p>Lorem, ipsum.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="feedback__top">
                        <p> Sed semper leo metus, a lacinia eros semper at. Etiam sodales orci sit amet vehicula
                            pellentesque. </p>            
                    </div>
                    <div class="feedback__bottom">
                        <img src="../Images/test3.jpg" alt="">
                        <div class="feedback__name">
                            <p>Mary Jane</p>
                            <p>Lorem, ipsum.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="news section">
        <div class="heading">
            <h2>TIN TỨC VÀ SỰ KIỆN MỚI</h2>
            <p>when climbing the carrer ladder</p>
        </div>
        <div class="news__content container">
            <div class="row">
                <div class="col-5">
                    <img class="img-fluid" src="../Images/news_1.jpg" alt="">
                </div>
                <div class="col-7">
                    <h3><a href="#" data-toggle="modal" data-target="#cyberModal">CHÀO ĐÓN CHI NHÁNH MỚI</a></h3>
                    <h4>03/05/2023</h4>
                    <p>Proin euismod vehicula vestibulum. Fusce ullamcorper aliquet dolor id egestas. Nulla leo purus,
                        facilisis non cursus ut, egestas sed ipsum.Fusce ullamcorper aliquet dolor id egestas. Nulla leo
                        purus, facilisis non cursus ut, egestas sed ipsum.Fusce ullamcorper aliquet dolor id egestas.
                        Nulla leo purus, facilisis non cursus ut, egestas sed ipsum.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-7">
                    <h3><a href="#" data-toggle="modal" data-target="#cyberModal">ƯU ĐÃI 30/4 - 1/5</a></h3>
                    <h4>29/04/2021</h4>
                    <p>Proin euismod vehicula vestibulum. Fusce ullamcorper aliquet dolor id egestas. Nulla leo purus,
                        facilisis non cursus ut, egestas sed ipsum.Fusce ullamcorper aliquet dolor id egestas. Nulla leo
                        purus, facilisis non cursus ut, egestas sed ipsum.Fusce ullamcorper aliquet dolor id egestas.
                        Nulla leo purus, facilisis non cursus ut, egestas sed ipsum.</p>
                </div>
                <div class="col-5">
                    <img class="img-fluid" src="../Images/news_2.png" alt="">
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="footer__top section">
            <div class="container">
                <div class="footer__grid row">
                    <div class="col-4">
                        <h3>Về Chúng Tôi</h3>
                        <p>
                            Nam libero tempore cum vulputate id est id, pretium semper enim. Morbi viverra congue nisi
                            vel
                            pulvinar posuere sapien eros.
                        </p>
                    </div>
                    <div class="col-4">
                        <h3>Các Chi Nhánh</h3>
                        <div class="footer__link">
                            <i class="fa fa-long-arrow-alt-right"></i>
                            <a href="#">Trần Hưng Đạo, TP.HCM</a>
                        </div>
                        <div class="footer__link">
                            <i class="fa fa-long-arrow-alt-right"></i>
                            <a href="#">Âu Cơ, TP.HCM</a>
                        </div>
                        <div class="footer__link">
                            <i class="fa fa-long-arrow-alt-right"></i>
                            <a href="#">Bà Điểm, TP.HCM</a>
                        </div>
                        <div class="footer__link">
                            <i class="fa fa-long-arrow-alt-right"></i>
                            <a href="#">Quận 6, TP.HCM</a>
                        </div>
                        <div class="footer__link">
                            <i class="fa fa-long-arrow-alt-right"></i>
                            <a href="#">Không Biết, Hà Nội</a>
                        </div>
                    </div>
                    <div class="col-4">
                        <h3>Thông Tin Liên Hệ</h3>
                        <div class="footer__contact">
                            <i class="fa fa-map-marker-alt"></i>
                            <a href="#">Phan Văn Hớn, Hóc Môn – HCM</a>
                        </div>
                        <div class="footer__contact">
                            <i class="far fa-envelope"></i>
                            <a href="mailto:info@restaurantAnhDuong.edu.vn">restaurantAnhDuong@gmail.com</a>
                        </div>
                        <div class="footer__contact">
                            <i class="fas fa-phone-alt"></i>
                            <a href="tel:0961051014">0932711034</a>
                        </div>
                    </div>
                </div>
                <div class="footer__form">
                    <form>
                        <div class="form-group form-row">
                            <label class="col-4 col-form-label" for="emailFooter">Đăng Ký Để Cập Nhật Tin Tức Mới Nhất</label>
                            <div class="col-6">
                                <input type="email" class="form-control" id="emailFooter"
                                placeholder="Enter Email Address ...">
                            </div>
                           <div class="col-2 text-center">
                            <button type="submit" class="btn">GỬI</button>
                           </div>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer__bottom">
            <div>
                © 2023 Instruction. All rights reserved | Design by <a href="#">PHYN</a> 
            </div>
        </div>
    </footer>
    <div class="modal fade" id="cyberModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">INSTRUCTION</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img class="img-fluid" src="./img/g12.jpg" alt="">
                    <p>Duis venenatis, turpis eu bibendum porttitor, sapien quam ultricies tellus, ac rhoncus risus odio
                        eget nunc. Pellentesque ac fermentum diam. Integer eu facilisis nunc, a iaculis felis.
                        Pellentesque pellentesque tempor enim, in dapibus turpis porttitor quis. Suspendisse ultrices
                        hendrerit massa. Nam id metus id tellus ultrices ullamcorper. Cras tempor massa luctus, varius
                        lacus sit amet, blandit lorem. Duis auctor in tortor sed tristique. Proin sed finibus sem</p>
                </div>

            </div>
        </div>
    </div>





    
    <script src="../js/jquery.min.js"></script>

    <script src="../js/bootstrap.bundle.min.js"></script>

    <script src="../js/owl.carousel.min.js"></script>
    <script>
        $('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 3
                }
            }
        })
    </script>
    

</body>
</html>