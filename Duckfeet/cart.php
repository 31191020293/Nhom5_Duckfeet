<?php session_start();?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/2ce82317a1.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/giohangf.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="css/Cart shopping.css">
    <link rel="shortcut icon" type="image/png" href="https://user-images.githubusercontent.com/92730744/170260720-870db785-0959-47c5-aff9-1b4f7ea736a0.png"/>
  <title>DUCKFEET STORE</title>
</head>
<body>
  <?php
  include_once"db_module.php";
  if (!isset($_SESSION["cart"])){
    $_SESSION["cart"]=array();
  }
  if (isset($_GET['action'])){
    switch($_GET['action']){
      case "add":
        foreach ($_POST['quantity'] as $id =>$quantity){
          $_SESSION["cart"][$id]=$quantity;
        }
        header('location:./cart.php');
        break;
      case "delete":
        if(isset($_GET['id'])){
          unset($_SESSION["cart"][$_GET['id']]);
        }
        header('location:./cart.php');
        break;
      case "submit":
        if (isset($_POST['update_click'])){
          foreach ($_POST['quantity'] as $id =>$quantity){
            $_SESSION["cart"][$id]=$quantity;
            header('location:./cart.php');
          }
        }elseif($_POST['order_click']){

        }
    }
  }
  if (!empty($_SESSION["cart"]))
  {
    
    taoKetNoi($link);
    $product = chayTruyVanTraVeDL($link,"select * from `tbl_sanpham` where `id_sp` IN (".implode(",",array_keys($_SESSION["cart"])).")");
                  
  }
  ?>
  <div class="fullcontainer">
    <!--header-->
    <header class="header header_pc" style="float: left;">
      <div class="header_pc">
          <div class="logo" style="height: 100%; width: 8%; float: left; margin-left: 0%; margin-right: 0%;">
              <img src="https://user-images.githubusercontent.com/92730744/169660616-43852a82-852d-4cbb-aba6-e93c8329d0aa.png" alt="" style="width:120px; height: 70%; margin-top: -3px; margin-left: 10%;">
          </div>
          <div class="menu" style="width: 60%; margin-left: 1%; margin-right: 0%; padding-left: 0%; font-size: 18px">
              <ul>
                  <li class="home"><a href="index.php">TRANG CHỦ</a></li>
                  <li class="home"><a href="index.php">HÀNG MỚI</a></li>
                  <li class="home"><a href="index.php">SẢN PHẨM</a></li>
                  <li class="home"><a href="index.php">KHUYẾN MÃI</a></li>
              </ul>
          </div>
          <div class="menu" id="lookup" style="margin-left: 0px;margin-top: 4px;">
              <form style="float: left; margin-left: -15%;" action="timkiem.php">
                  <input class="form-input-control" style="width: 200px; height: 25px" name="keyword">
                  <input type="submit" style="background-color: rgba(158, 93, 49, 0.15); border: 1px solid; margin-top: 13px;height: 25px;width: 76px;" value=" Tìm Kiếm">
              </form>
          </div>
          <div class="menu">                          
              <a href="./">
                  <div class="menu_icon" style="width: 30px;padding-top:12%; padding-left: 5px; margin-left: -3px;">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304z"/></svg>  
                  </div>
              </a>
              <a href="cart.php">
                  <div class="menu_icon" style="width: 37px; padding-top:12%; margin-left: 20px; padding-left: 5px;">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 0C107.5 0 117.4 8.19 119.6 19.51L121.1 32H541.8C562.1 32 578.3 52.25 572.6 72.66L518.6 264.7C514.7 278.5 502.1 288 487.8 288H170.7L179.9 336H488C501.3 336 512 346.7 512 360C512 373.3 501.3 384 488 384H159.1C148.5 384 138.6 375.8 136.4 364.5L76.14 48H24C10.75 48 0 37.25 0 24C0 10.75 10.75 0 24 0H96zM128 464C128 437.5 149.5 416 176 416C202.5 416 224 437.5 224 464C224 490.5 202.5 512 176 512C149.5 512 128 490.5 128 464zM512 464C512 490.5 490.5 512 464 512C437.5 512 416 490.5 416 464C416 437.5 437.5 416 464 416C490.5 416 512 437.5 512 464z"/></svg>
                  </div>
              </a>
          </div>
      </div>
    </header>
    <div class="header_mobile" style="float:left;">
        <div class="logo header_mobile_logo " style="height: 100%; float: left; margin-left: 0%; margin-right: 0%; margin-top: 0%;">
            <img src="https://user-images.githubusercontent.com/92730744/169660616-43852a82-852d-4cbb-aba6-e93c8329d0aa.png" alt="" style="width: 65%;height: 75%;margin-top: 5%;margin-left: 6%;">
        </div>
        <label for="header-mobile-input" class="header_bars-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M0 96C0 78.33 14.33 64 32 64H416C433.7 64 448 78.33 448 96C448 113.7 433.7 128 416 128H32C14.33 128 0 113.7 0 96zM0 256C0 238.3 14.33 224 32 224H416C433.7 224 448 238.3 448 256C448 273.7 433.7 288 416 288H32C14.33 288 0 273.7 0 256zM416 448H32C14.33 448 0 433.7 0 416C0 398.3 14.33 384 32 384H416C433.7 384 448 398.3 448 416C448 433.7 433.7 448 416 448z"/></svg>
        </label>
        <input type="checkbox" hidden class="header_input" name="" id="header-mobile-input">
        <label for="header-mobile-input" class="header_overlay"></label>
        <div class="menu_header-mobile">
            <label for="header-mobile-input" class="menu_header_mobile-close">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M310.6 361.4c12.5 12.5 12.5 32.75 0 45.25C304.4 412.9 296.2 416 288 416s-16.38-3.125-22.62-9.375L160 301.3L54.63 406.6C48.38 412.9 40.19 416 32 416S15.63 412.9 9.375 406.6c-12.5-12.5-12.5-32.75 0-45.25l105.4-105.4L9.375 150.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L160 210.8l105.4-105.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-105.4 105.4L310.6 361.4z"/></svg>
            </label>
            <hr style="margin-top: 20%;">
            <div class="menu header_mobile_logo" id="lookup">
                <form style="float: left; width: 300px; margin-left: 20px">
                    <input class="form-input-control" style="float:left;" name="keyword">
                    <input type="submit" style="background-color: rgba(158, 93, 49, 0.15); border: 1px solid; margin-left: 5px" value=" Tìm Kiếm">
                </form>
            </div>
            <ul style="clear: both;">
                <li class="menu_header-mobile-link"><a style="text-decoration: none;" href="index.php">TRANG CHỦ</a></li>
                <li class="menu_header-mobile-link"><a style="text-decoration: none;" href="index.php">HÀNG MỚI</a></li>
                <li class="menu_header-mobile-link"><a style="text-decoration: none;" href="index.php">SẢN PHẨM</a></li>
                <li class="menu_header-mobile-link"><a style="text-decoration: none;" href="index.php">KHUYẾN MÃI</a></li>
                <li class="menu_header-mobile-link"><a style="text-decoration: none;" href="cart.php">GIỎ HÀNG</a></li>
            </ul>
        </div>
    </div>
    <!--breakcrumbs-->
    <div class="breadcrumbs">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <div class="bread-inner" style="margin-top: 15px">
                      <ul class="bread-list">
                        <li><a href="index.php" style="font-size: 17px">Trang chủ /<i class="ti-arrow-right"></i></a></li>
                        <li><a href="timkiem.php?keyword=" style="font-size: 17px">Tìm kiếm /<i class="ti-arrow-right"></i></a></li>
                        <li class="active" style="font-size: 17px">Giỏ hàng</li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
    </div>

    <form id="cart-form" action ="cart.php?action=submit" method="POST">
      <!-- Shopping Cart -->
      <div class="shopping-cart section">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <!-- Shopping Summery -->
              <table class="table shopping-summery">
                <thead>
                  <tr class="main-hading">
                    <th class="text-center">SẢN PHẨM</th>
                    <th class="text-center">TÊN SẢN PHẨM</th>
                    <th class="text-center">GIÁ</th>
                    <th class="text-center">SỐ LƯỢNG</th>
                    <th class="text-center">TỔNG CỘNG</th> 
                    <th class="text-center"><i class="fa-solid fa-trash-can"></i></th>
                  </tr>
                  </thead>
                <tbody>
                <?php
                if (!empty($product)){
                  $total=0;
                  while ($row= mysqli_fetch_array($product)){
                    ?>
                    <tr>
                      <td class="image" data-title="Ảnh Sản Phẩm"><center><a href="chitietsanpham.php?id=<?=$row['id_sp']?>"><img src="<?=$row['img_sp']?>" alt="#"></a></td>
                      <td class="product-des" data-title="Tên Sản Phẩm"><center><a href="chitietsanpham.php?id=<?=$row['id_sp']?>"><?=$row['ten_sp']?></a></td>
                      <td class="price" data-title="Giá"><center><?=number_format($row['gia'])?></td>
                      <td class="qty" data-title="Số lượng"><center><input type='text' style='width:50px; text-align:center'value=<?=$_SESSION["cart"][$row['id_sp']]?> name='quantity[<?=$row['id_sp']?>]'></td>
                      <td class="total-amount" data-title="Tổng cộng"><center><?=number_format($row['gia']*$_SESSION["cart"][$row['id_sp']])?></td> 
                      <td class="action" data-title="Xóa"><center><a href="cart.php?action=delete&id=<?=$row['id_sp']?>"><i class="fa-solid fa-trash-can"></i></a></td>
                    </tr>
                    <?php
                      $total+=$row['gia']*$_SESSION["cart"][$row['id_sp']];
                    }
                    ?>
                    <?php
                }
                ?>       
                </tbody>
              </table>
            </div>
          <div class="row">
            <div class="col-12">
              <div class="total-amount">
                <div class="row">
                  <div class="col-lg-8 col-md-5 col-12">
                    <div class="left">
                      <div class="coupon">
                        <form action="#" target="_blank">
                          <input style="border: none; height: 50px" name="Coupon" placeholder ="Enter Your Coupon">
                          <button style="margin-top: -5px; background-color: white; color: black" class="btn">ÁP DỤNG</button>
                        </form>
                      </div>
                      <div class="checkbox">
                        <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox"> Phí ship (FREE)</label> 
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-7 col-12">
                    <div class="right">
                      <ul>
                      <li>TỔNG CỘNG<span style='margin-left:20px'><?=number_format($total)?> VND</span></li>
                      <li>PHÍ SHIP<span style='margin-left:110px'> FREE</span></li>
                      <li>DISCOUNT<span style='color: red;margin-left:90px'> &nbsp&nbsp10%</span></li>
                      <?php $Gia=$total-($total*0.1); ?>
                      <li class="last">PHẢI TRẢ<span style='margin-left:30px'> &nbsp&nbsp<?=number_format($Gia)?> VND</span></li>
                      <input type ="submit" name="update_click" value="CẬP NHẬT"  Style ='display: inline-block; height: 50px; width:100px;border: navajowhite; margin-left: 4px; background: transparent; color: #333;background: #fff; box-shadow: 0px 0px 5px #00000012;'>
                      <input type ="submit" name="order_click" value="MUA HÀNG"Style ='display: inline-block; height: 50px; width:100px;border: navajowhite; margin-left: 4px; background: transparent; color: #333;background: #fff; box-shadow: 0px 0px 5px #00000012;'>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
          </div>
      </div>
    </form> 
    <section class="shop-services section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
              <div class="single-service">
              <i class="material-icons" style="font-size:30px">local_shipping</i></i>
              <h4>MIỄN PHÍ SHIP</h4>
              <p>Đơn đặt hàng tối thiểu 1 triệu</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="material-icons" style="font-size:30px">autorenew</i>
              <h4>MIỄN PHÍ ĐỔI TRẢ</h4>
              <p>Đổi trả trong vòng 30 ngày</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="material-icons" style="font-size:30px">credit_card</i>
              <h4>THANH TOÁN AN TOÀN</h4>
              <p>100% thanh toán an toàn</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="material-icons" style="font-size:30px">attach_money</i>
              <h4>GIÁ TỐT NHẤT</h4>
              <p>Giá đảm bảo tốt nhất</p>
            </div>
            <!-- End Single Service -->
          </div>
        </div>
      </div>
	  </section>
    <!--footer-->
    <div class="fulcontainer-fluid footer" style="text-align: left !important; background-color: rgba(158, 93, 49, 0.502);">
      <div class="container">
          <div class="footer-1">
              <h4>DUCKFEET</h4>
              <p>Trường Đại học Kinh tế TP.HCM<br/></p>
              <p>279 Nguyễn Tri Phương, phường 14, quận 10, TP.HCM <br/></p>
              <p>Số điện thoại: 1800191919 <br/></p>
              <p>Email: bangiaygiare@giayre.com<br/></p>
              <p>CSKH<br/></p>
          </div>
          <div class="footer-2">
              <h4>LIÊN KẾT NHANH</h4>
              <p>Hướng dẫn mua hàng <br/></p>
              <p>Chính sách<br/></p>
              <p>Hệ thống cửa hàng <br/></p>
              <p>Hướng dẫn chọn size <br/></p>
              <img src="https://user-images.githubusercontent.com/92730744/169662528-92a82363-bfe9-43bc-94ee-1a9d05842708.png" width="100px" height="40px">
          </div>
          <div class="footer-3">
              <h4>FACEBOOK</h4>
              <div><img src="https://user-images.githubusercontent.com/92730744/169659926-e3bda957-a0ff-4510-b803-967efc8a8f50.png " width="200px" height="100px" ></div>
              <div class="footer-3-icon">
                  <i class="fa-brands fa-facebook"></i>
                  <i class="fa-brands fa-instagram-square"></i>
                  <i class="fa-brands fa-youtube"></i>
                  <i class="fa-brands fa-tiktok"></i>
              </div>
          </div>
      </div>
    </div>
  </div>
</body>
<style>
  .single-service p{margin-top: -6px}
</style>
</html>