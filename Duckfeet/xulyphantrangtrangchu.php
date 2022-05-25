<html>
    <body>
        <?php
        require_once "db_module.php";
        $link = null;
        taoKetNoi($link);

        $from_p = 0;
        if(isset($_GET['page']))
            $from_p = $_GET['page'];
        $from = NUM_PROD_PER_PAGE * $from_p;

        $result = chayTruyVanTraVeDL($link, "select * from tbl_sanpham limit $from, ".NUM_PROD_PER_PAGE);
        while($rows=mysqli_fetch_assoc($result)){
            echo "
                <a target='_blank' href='chitietsanpham.php?id=".$rows['id_sp']."' class='a_product'>
                    <div class='product'>
                        <img src='".$rows['img_sp']."' width='150' height='150'>
                        <h1>".$rows['ten_sp']."</h1>
                        <br>
                        <span class='gia'>".number_format($rows['gia'])." VND</span>
                    </div>
                </a>
            ";
        }
        ?>
        
        <br style="clear:both;">
        <hr>

        <?php
            $result = chayTruyVanTraVeDL($link, "select count(*) from tbl_sanpham");
            $total_r = mysqli_fetch_row($result);
            $total = $total_r[0];
            $pages = ceil($total/NUM_PROD_PER_PAGE);

            echo"<span class='pagination'>";
            for($i=0; $i<$pages; $i++)    
                echo "<button><a href='?page=".$i."'>".$i."</a></button>";
            echo"</span>";
        ?>
        <style>
            .a_product{display: inline-block; text-decoration: none; text-align: center;}
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
            .pagination{text-align: center;padding-left: 44%}
        </style>
    </body>
</html>