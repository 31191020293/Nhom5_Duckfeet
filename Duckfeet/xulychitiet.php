<html>
    <body>
        <?php
            include_once "db_module.php";
            $link = null;


            if(isset($_GET['id'])){
                taoKetNoi($link);
                $result = chayTruyVanTraVeDL($link, 
                    "select * from tbl_sanpham where id_sp=".$_GET['id']);
                $data = mysqli_fetch_row($result);
                echo"
                <div class='container detail'>
                    <div class='row'>
                        <div class='product-left col-lg-6 col-md-12'>
                            <img src='".$data[5]."' width='100%' height='auto'>
                        </div>
                        <div class='product-right col-lg-6 col-md-12'>
                            <h1>".$data[1]."</h1>
                            <span><h4 style='color: gray; font-weight: bold'>Giá tiền: ".number_format($data[3])." VND</h4></span>
                            <div class='product-right-product-size'> 
                                <p style='font-weight: bold;'> Size: </p>
                                <div class='size'> 
                                    <span>36</span>
                                    <span>37</span>
                                    <span>38</span>
                                    <span>39</span>
                                    <span>40</span>
                                </div>
                            </div>
                            <div class='product-right-product-icon'>
                                <div class = 'product-right-product-icon-item'>
                                    <i class='fa-solid fa-phone'  style='float: left; margin-right: 7px'></i> 
                                    <p><b>Hotline:1800191919</b>(8h00 : 22h00)</p>
                                </div>
                                <div class = 'product-right-product-icon-item'>
                                    <i class='fa-solid fa-truck-fast' style='float: left; margin-right: 5px'></i> 
                                    <p><b>Ship hàng toàn quốc</b> (từ 3-7 ngày)</p>
                                </div>
                                <div class = 'product-right-product-icon-item'>
                                    <i class='fa-solid fa-clock-rotate-left' style='float: left; margin-right: 7px'></i> 
                                    <p><b>Đổi trả trong 30 ngày</b> (Hỗ trợ đổi trả ngay tại nhà)</p>
                                </div>
                            </div>
                            
                            <form id='add-to-cart-form' method='post' action='cart.php?action=add'>
                            <input style='text-align: center' type='hidden' name='product_id' value='".$data[0]."'>
                            <h5 style='float: left; margin-right: 20px; margin-top:5px'>Số lượng:</h5>
                            <input style='text-align: center; margin-top: 5px' type='number' name='quantity[$data[0]]' value='1' min='1' max='20' placeholder='quantity' required><br style='clear: both;'>
                            <input type='submit' style='background-color: rgba(158, 93, 49,0.5); height: 30px; margin-top: 5px; border: 1px solid; border-radius: 10px' value='   Thêm vào giỏ hàng   ' width='150px'>
                            <input type='submit' style='background-color: rgba(158, 93, 49,0.5); height: 30px; margin-top: 5px; border: 1px solid;border-radius: 10px' value='   Mua ngay   ' width='150px'>
                        </form>
                            <hr>
                            <span><h4>Thông tin sản phẩm</h4>".($data[2])."</span>
                        </div>
                    </div>
                </div></form>
                ";
            }else
                header("location: /duckfeet");
        ?>
    </body>
    <style>
        .detail{padding-top: 10px;}
        .product-right{padding-top: 20px}
        .product-right-product-size span {
            display: inline-block; 
            padding: 6px 15px;
            border: 1px solid #dddddd;
            margin: 5px 10px 10px 0;
            font-size: 15px;
            cursor: pointer;
        }
        .product-right-product-size span:hover{
            background-color: rgb(234, 152, 58);
            color: azure;
        }
        /* Mobile*/
        @media screen and (max-width: 1023px) {
            .product-left, .product-right, {
                width: 100%;
            }
        }
    </style>
</html>