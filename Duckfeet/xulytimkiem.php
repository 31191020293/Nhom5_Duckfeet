<?php
    require_once "db_module.php";
    $link = null;
    taoKetNoi($link);
    
    $from_p = 0;
    if(isset($_GET['page']))
        $from_p = $_GET['page'];
    $from = NUM_PROD_PER_PAGE * $from_p;

    // Xác định tổng số sẵn phẩm
    if(isset($_GET['keyword']))
        $result=chayTruyVanTraVeDL($link,"select count(*)from tbl_sanpham where ten_sp like'%".$_GET['keyword']."%'");
    else
        $result=chayTruyVanTraVeDL($link,"select count(*)from tbl_sanpham");
    $row =mysqli_fetch_row($result);
    $total =ceil($row[0]/NUM_PROD_PER_PAGE);
    //Xác định các sản phẩm sẽ cần hiển thị cho trang hiện tại
    if(isset($_GET['keyword']))
        $result=chayTruyVanTraVeDL($link,"select * from tbl_sanpham where ten_sp like '%".$_GET['keyword']."%' limit $from, ".NUM_PROD_PER_PAGE);
    else
        $result=chayTruyVanTraVeDL($link,"select * from tbl_sanpham limit $from, ".NUM_PROD_PER_PAGE);
    while($rows=mysqli_fetch_assoc($result)){
        echo
        "<a target='_blank' href='chitietsanpham.php?id=".$rows['id_sp']."' class='a_product'>
            <div class='product'>
                <img src='".$rows['img_sp']."' width='150' height='150'>
                <h1>".$rows['ten_sp']."</h1>
                <br>
                <span class='gia'>".number_format($rows['gia'])." VND</span>
            </div>
        </a>";
    }
    echo"<hr style='clear: both; '/>";
    echo"<div class='pagination'>";
    for($i=0;$i<$total;$i++)
        echo "<button><a href='timkiem.php?page=".$i."& keyword='".$_GET['keyword']."'>".$i."</a></button>";
    echo"</div>";
?>
<style>
    .pager{
        background-color:orange;padding:3px;
        text-align:center;margin-left:5px;word-spacing:10px;}
    .a_product{display: inline-block; text-decoration: none; text-align: center; margin: 0px 10px}
    .product{
        border:1px solid gray; 
        margin-left: 5px;
        margin-top: 10px;
        opacity:.8;
    }
    .product h1{font-size: 13pt; font-weight: bold;}
    .product:hover{opacity:1; cursor: pointer;}
    .pagination a{text-decoration: none;}
    .pagination button{
        padding: 5px 10px;
        margin-left: 10px;
        border: 0.5px solid black;
    }
    .product{text-align: center}
    .pagination{text-align: center; padding-left: 45%}
</style>